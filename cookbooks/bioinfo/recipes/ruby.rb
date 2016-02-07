package 'ruby1.8'
include_recipe "rvm"
include_recipe "rvm::system"
rvm_ruby "ruby-2.0.0-p0"
rvm_default_ruby "ruby-2.1.0"
