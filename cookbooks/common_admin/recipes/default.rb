#
# Cookbook Name:: common_admin
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

directory '/home/YOURADMINUSR/.ssh' do
  recursive true
  action :delete
end

directory '/home/YOURADMINUSR/.ssh' do
  owner 'YOURADMINUSR'
  group 'YOURADMINUSR'
  action :create
  mode '0700'
end

template '/home/YOURADMINUSR/.ssh/id_rsa' do
  source 'id_rsa_private.erb'
  mode '600'
  owner 'YOURADMINUSR'
  group 'YOURADMINUSR'
end

template '/home/YOURADMINUSR/.ssh/id_rsa.pub' do
  source 'id_rsa_pub.erb'
  mode '644'
  owner 'YOURADMINUSR'
  group 'YOURADMINUSR'
end

template '/home/YOURADMINUSR/.ssh/authorized_keys' do
  source 'id_rsa_pub.erb'
  mode '644'
  owner 'YOURADMINUSR'
  group 'YOURADMINUSR'
end

#include_recipe 'common_admin::monitoring-server'
include_recipe 'common_admin::modules'
package 'sshpass'
