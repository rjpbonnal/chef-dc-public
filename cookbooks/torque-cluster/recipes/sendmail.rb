#
# Cookbook Name:: torque-cluster
# Recipe:: master_sendmail
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


package "sendmail" do
  action :install
end

template '/etc/mail/sendmail.mc' do
  source 'sendmail.erb'
  mode '644'
  owner 'root'
  group 'smmsp'
end

execute "m4" do
  command "m4 sendmail.mc > sendmail.cf"
  cwd "/etc/mail"
end


service "sendmail" do
  action :restart
end