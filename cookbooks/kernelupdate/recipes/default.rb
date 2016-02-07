#
# Cookbook Name:: kernel
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
execute "apt-get install linux 3.2.0.57" do
  command "apt-get -y install linux-headers-3.2.0-57-generic linux-image-3.2.0-57-generic "
  action :install
end