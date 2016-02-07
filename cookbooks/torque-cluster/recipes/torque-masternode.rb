# torque-package-server-linux-x86_64.sh
# torque.setup #{node.torque['adminuser']}

package "build-essential"
package "libssl-dev"
package "libxml2-dev"
package "openssh-server"

bash "Install Torque Server" do
  cwd "#{node.ingm[:packages_file_cache_path]}/torque-#{node.torque[:version]}"
  code <<-EOH
  ./torque-package-server-linux-x86_64.sh --install
  ./torque-package-clients-linux-x86_64.sh --install
  ./torque-package-gui-linux-x86_64.sh --install
  ./torque-package-devel-linux-x86_64.sh --install
  cp contrib/init.d/debian.pbs_mom /etc/init.d/pbs_mom
  cp contrib/init.d/debian.pbs_server /etc/init.d/pbs_server
  cp contrib/init.d/debian.trqauthd /etc/init.d/trqauthd
  echo /usr/local/lib > /etc/ld.so.conf.d/torque.conf
  ldconfig
  update-rc.d trqauthd defaults
  update-rc.d pbs_mom defaults
  update-rc.d pbs_server defaults
  EOH
end

pbs_mom_pid = `pidof pbs_mom`.chop
pbs_server_pid = `pidof pbs_server`.chop
trqauthd_pid = `pidof trqauthd`.chop
Process.kill("SIGTERM", pbs_mom_pid.to_i) unless pbs_mom_pid.empty?
Process.kill("SIGTERM", pbs_server_pid.to_i) unless pbs_server_pid.empty?
Process.kill("SIGTERM", trqauthd_pid.to_i) unless trqauthd_pid.empty?

bash "Create blank server" do
  cwd "#{node.ingm[:packages_file_cache_path]}/torque-#{node.torque[:version]}"
  code <<-EOH
  service trqauthd start
  pbs_server -f -t create
  EOH
end
  
bash "Configure Torque Queue" do
  cwd "#{node.ingm[:packages_file_cache_path]}/torque-#{node.torque[:version]}"
  code <<-EOH
  echo "qmgr -c 'create queue #{node.torque[:queue_name]}'"
  echo "qmgr -c 'set queue #{node.torque[:queue_name]} queue_type = Execution'"
  echo "qmgr -c 'set queue #{node.torque[:queue_name]} resources_default.neednodes = 1'"
  echo "qmgr -c 'set queue #{node.torque[:queue_name]} enabled = True'"
  echo "qmgr -c 'set queue #{node.torque[:queue_name]} started = True'"
  echo "qmgr -c 'set server scheduling = True'"
  echo "qmgr -c 'set server acl_hosts = #{node.hostname}'"
  echo "qmgr -c 'set server managers += #{node.torque[:adminuser]}@#{node.hostname}.#{node.ingm[:domain]}'"
  echo "qmgr -c 'set server operators += #{node.torque[:adminuser]}@#{node.hostname}.#{node.ingm[:domain]}'"
  echo "qmgr -c 'set server default_queue = #{node.torque[:queue_name]}'"
  echo "qmgr -c 'set server log_events = 511'"
  echo "qmgr -c 'set server mail_from = #{node.torque[:adminuser]}'"
  echo "qmgr -c 'set server scheduler_iteration = 600'"
  echo "qmgr -c 'set server node_check_rate = 150'"
  echo "qmgr -c 'set server tcp_timeout = 300'"
  echo "qmgr -c 'set server job_stat_rate = 45'"
  echo "qmgr -c 'set server poll_jobs = True'"
  echo "qmgr -c 'set server log_level = 5'"
  echo "qmgr -c 'set server mom_job_sync = True'"
  echo "qmgr -c 'set server mail_domain = #{node.ingm[:mail_domain]}'"
  echo "qmgr -c 'set server next_job_number = 148'"
  echo "qmgr -c 'set server moab_array_compatible = True'"
  
  qmgr -c "create queue #{node.torque[:queue_name]}"
  qmgr -c "set queue #{node.torque[:queue_name]} queue_type = Execution"
  qmgr -c "set queue #{node.torque[:queue_name]} resources_default.neednodes = 1"
  qmgr -c "set queue #{node.torque[:queue_name]} enabled = True"
  qmgr -c "set queue #{node.torque[:queue_name]} started = True"
  
  qmgr -c "set server scheduling = True"
  qmgr -c "set server acl_hosts = #{node.hostname}"
  qmgr -c "set server managers += #{node.torque[:adminuser]}@#{node.hostname}.#{node.ingm[:domain]}"
  qmgr -c "set server operators += #{node.torque[:adminuser]}@#{node.hostname}.#{node.ingm[:domain]}"
  qmgr -c "set server default_queue = #{node.torque[:queue_name]}"
  qmgr -c "set server log_events = 511"
  qmgr -c "set server mail_from = #{node.torque[:adminuser]}"
  qmgr -c "set server scheduler_iteration = 600"
  qmgr -c "set server node_check_rate = 150"
  qmgr -c "set server tcp_timeout = 300"
  qmgr -c "set server job_stat_rate = 45"
  qmgr -c "set server poll_jobs = True"
  qmgr -c "set server log_level = 5"
  qmgr -c "set server mom_job_sync = True"
  qmgr -c "set server mail_domain = #{node.ingm[:mail_domain]}"
  qmgr -c "set server next_job_number = 148"
  qmgr -c "set server moab_array_compatible = True"
  EOH
end

bash  "Start Torque Sercer" do
  cwd "#{node.ingm[:packages_file_cache_path]}/torque-#{node.torque[:version]}"
  code <<-EOH
  service pbs_server stop
  service pbs_server start
  EOH
end


cookbook_file node.maui[:filename] do
  path "/tmp/#{node.maui[:filename]}"
  action :create_if_missing
end

bash 'Unpack Maui Archive' do
  cwd '/tmp'
  code <<-EOH
  tar xzvf #{node.maui[:filename]}
  EOH
end

bash 'Configure, Compile and Install Maui' do
  cwd "/tmp/maui-#{node.maui[:version]}"
  code <<-EOH
  ./configure --with-pbs --with-spooldir=/var/spool/maui
  make
  make install
  rm -rf #{node.ingm[:packages_file_cache_path]}/maui-#{node.maui[:version]}
  
  EOH
end

template '/etc/init.d/maui' do
  source 'maui.erb'
  mode '755'
  owner 'root'
  group 'root'
end

bash 'Register Maui as a service' do 
  code <<-EOH
  ps -ef | grep "maui" | awk '{print $2}' | xargs kill
  update-rc.d maui defaults
  service maui start
  EOH
end
