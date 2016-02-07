#
# Cookbook Name:: nis
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package 'nis'

template '/etc/yp.conf' do
  variables({
	  :server => "your.server.domain"
   })
   source 'yp.conf.erb'
   notifies :restart, 'service[ypbind]'
end

template '/etc/nsswitch.conf' do 
  source 'nsswitch.conf.erb'
end

template '/etc/pam.d/common-session' do
  source 'pam.d_common-session.erb'
end


service 'ypbind' do
  action [:enable, :start]
end
