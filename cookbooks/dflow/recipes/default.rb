#
# Cookbook Name:: dflow
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
# dflow recipe permits to install DirectFlow client 

include_recipe "kernelupdate"
package 'panfs-3.2.0-57-generic-5.0.1.h-1013848.5.ul_1204_x86_64.deb' do
provider Chef::Provider::Package::Dpkg
source "/mnt/hpcapps-archive/chef-package-cache/panfs-3.2.0-57-generic-5.0.1.h-1013848.5.ul_1204_x86_64.deb"
action :install
end

