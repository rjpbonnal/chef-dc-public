include_recipe 'modules::default'
include_recipe 'modules::source'

link "/etc/profile.d/modules_bash.sh" do
  to File.join(node.modules.install_path,node.modules.version,'init','bash')
end