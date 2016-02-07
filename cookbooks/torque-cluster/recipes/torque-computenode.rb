package "openssh-server"


bash "Install Torque Node" do
  cwd "#{node.ingm[:packages_file_cache_path]}/torque-#{node.torque[:version]}"
  pbs_mom_pid = `pidof pbs_mom`.chop
  trqauthd_pid = `pidof trqauthd`.chop
  Process.kill("SIGTERM", pbs_mom_pid.to_i) unless pbs_mom_pid.empty?
  Process.kill("SIGTERM", trqauthd_pid.to_i) unless trqauthd_pid.empty?
  code <<-EOH
  ./torque-package-mom-linux-x86_64.sh --install
  ./torque-package-clients-linux-x86_64.sh --install
  cp contrib/init.d/debian.trqauthd /etc/init.d/trqauthd
  cp contrib/init.d/debian.pbs_mom /etc/init.d/pbs_mom
  echo /usr/local/lib > /etc/ld.so.conf.d/torque.conf
  ldconfig
  update-rc.d trqauthd defaults
  update-rc.d pbs_mom defaults
  service trqauthd start
  service pbs_mom start  
  EOH
end

execute "Register the node #{node.hostname} into the queue" do
  user "YOURADMINUSR"
  command "ssh `cat /var/spool/torque/server_name` \"qmgr -c 'create node #{node.hostname} np=#{node[:cpu][:total].to_i-1}'\""
  not_if "ssh `cat /var/spool/torque/server_name` \"pbsnodes\" | grep #{node.hostname}", :user => "YOURADMINUSR"
end 

execute "Activate node #{node.hostname}" do
  user "YOURADMINUSR"
  command "ssh `cat /var/spool/torque/server_name` \"pbsnodes -c #{node.hostname}\""
  not_if "pbsnodes #{node.hostname} | grep free", :user => "YOURADMINUSR"
end


template "/etc/sysctl.d/60-torque.conf" do
  source "sysctl.d_torque.conf.erb"
  user "root"
  group "root"
end

execute "Update system with new sysctl torque" do
  user "root"
  command "sysctl -p /etc/sysctl.d/60-torque.conf"
end


