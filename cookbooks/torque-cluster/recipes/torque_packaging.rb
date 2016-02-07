#
# Cookbook Name:: torque-cluster
# Recipe:: torque_packaging
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# include_recipe "torque-cluster::torque_packaging" unless 







package "build-essential"
package "libssl-dev"
package "libxml2-dev"
package "g++"
package "gpp"
package "kcc"
package "libtool"
package "openssh-server"

cookbook_file node.torque[:filename] do
  path "/tmp/#{node.torque[:filename]}"
  action :create_if_missing
  not_if {(::File.directory?("#{node.ingm[:packages_file_cache_path]}/torque-#{node.torque[:version]}") && ::Dir.glob("#{node.ingm[:packages_file_cache_path]}/torque-#{node.torque[:version]}/**/*").select { |f| File.file?(f) }.sort == %w( contrib/init.d/debian.pbs_mom contrib/init.d/debian.pbs_server contrib/init.d/debian.trqauthd torque-package-clients-linux-x86_64.sh torque-package-devel-linux-x86_64.sh torque-package-doc-linux-x86_64.sh torque-package-gui-linux-x86_64.sh torque-package-mom-linux-x86_64.sh torque-package-server-linux-x86_64.sh torque.setup ).map{|x| ::File.join("#{node.ingm[:packages_file_cache_path]}/torque-#{node.torque[:version]}",x)})}
end

bash 'Unpack Torque Archive' do
  cwd '/tmp'
  code <<-EOH
  tar xzvf #{node.torque[:filename]}
  EOH
  not_if {(::File.directory?("#{node.ingm[:packages_file_cache_path]}/torque-#{node.torque[:version]}") && ::Dir.glob("#{node.ingm[:packages_file_cache_path]}/torque-#{node.torque[:version]}/**/*").select { |f| File.file?(f) }.sort == %w( contrib/init.d/debian.pbs_mom contrib/init.d/debian.pbs_server contrib/init.d/debian.trqauthd torque-package-clients-linux-x86_64.sh torque-package-devel-linux-x86_64.sh torque-package-doc-linux-x86_64.sh torque-package-gui-linux-x86_64.sh torque-package-mom-linux-x86_64.sh torque-package-server-linux-x86_64.sh torque.setup ).map{|x| ::File.join("#{node.ingm[:packages_file_cache_path]}/torque-#{node.torque[:version]}",x)})}
end

bash 'Configure, Compile and Package Torque' do
  cwd "/tmp/torque-#{node.torque[:version]}"
  code <<-EOH
  ./configure --with-server-name=#{node.fqdn} --with-sendmail=/usr/sbin/sendmail
  make
  make packages
  rm -rf #{node.ingm[:packages_file_cache_path]}/torque-#{node.torque[:version]}
  EOH
  not_if {(::File.directory?("#{node.ingm[:packages_file_cache_path]}/torque-#{node.torque[:version]}") && ::Dir.glob("#{node.ingm[:packages_file_cache_path]}/torque-#{node.torque[:version]}/**/*").select { |f| File.file?(f) }.sort == %w( contrib/init.d/debian.pbs_mom contrib/init.d/debian.pbs_server contrib/init.d/debian.trqauthd torque-package-clients-linux-x86_64.sh torque-package-devel-linux-x86_64.sh torque-package-doc-linux-x86_64.sh torque-package-gui-linux-x86_64.sh torque-package-mom-linux-x86_64.sh torque-package-server-linux-x86_64.sh torque.setup ).map{|x| ::File.join("#{node.ingm[:packages_file_cache_path]}/torque-#{node.torque[:version]}",x)})}
end

bash "Share Pakages in #{node.ingm[:packages_file_cache_path]}" do
  cwd "/tmp/torque-#{node.torque[:version]}"
  code <<-EOH
  mkdir -p #{node.ingm[:packages_file_cache_path]}/torque-#{node.torque[:version]}/contrib/init.d/
  cp torque-package-* #{node.ingm[:packages_file_cache_path]}/torque-#{node.torque[:version]}/
  cp torque.setup #{node.ingm[:packages_file_cache_path]}/torque-#{node.torque[:version]}/
  cp contrib/init.d/debian.pbs_mom #{node.ingm[:packages_file_cache_path]}/torque-#{node.torque[:version]}/contrib/init.d/
  cp contrib/init.d/debian.pbs_server #{node.ingm[:packages_file_cache_path]}/torque-#{node.torque[:version]}/contrib/init.d/
  cp contrib/init.d/debian.trqauthd #{node.ingm[:packages_file_cache_path]}/torque-#{node.torque[:version]}/contrib/init.d/
  EOH
  not_if {(::File.directory?("#{node.ingm[:packages_file_cache_path]}/torque-#{node.torque[:version]}") && ::Dir.glob("#{node.ingm[:packages_file_cache_path]}/torque-#{node.torque[:version]}/**/*").select { |f| File.file?(f) }.sort == %w( contrib/init.d/debian.pbs_mom contrib/init.d/debian.pbs_server contrib/init.d/debian.trqauthd torque-package-clients-linux-x86_64.sh torque-package-devel-linux-x86_64.sh torque-package-doc-linux-x86_64.sh torque-package-gui-linux-x86_64.sh torque-package-mom-linux-x86_64.sh torque-package-server-linux-x86_64.sh torque.setup ).map{|x| ::File.join("#{node.ingm[:packages_file_cache_path]}/torque-#{node.torque[:version]}",x)})}
end

