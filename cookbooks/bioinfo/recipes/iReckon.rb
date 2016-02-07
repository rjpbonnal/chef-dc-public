node.bioinfo[:iReckon].each do |program|
  bioinfo_dowload_and_cleandir program
  
  bash header = "Installing #{program[:name]} version #{program[:version]}" do
            cwd "#{node.bioinfo[:apps_directory]}/#{program[:name]}"
            code <<-EOH
            mkdir -p #{program[:version]}
            mv #{node.bioinfo[:apps_download_directory]}/#{program[:file]} #{node.bioinfo[:apps_directory]}/#{program[:name]}/#{program[:version]}/
            chmod 755 #{node.bioinfo[:apps_directory]}/#{program[:name]}/#{program[:version]}/#{program[:file]}
            #{yield if block_given?}        
            EOH
          end
          
          create_module_program program
end
