

node.bioinfo[:star].each do |program|
  bioinfo_dowload_and_cleandir program

  bioinformatic_install program 
  
  create_bioinformatic_profile

  create_module_program program

end #each version


template "/etc/sysctl.d/60-star.conf" do
  source "sysctl.d_star.conf.erb"
  user "root"
  group "root"
end

execute "Update system with new sysctl STAR" do
  user "root"
  command "sysctl -p /etc/sysctl.d/60-star.conf"
end


