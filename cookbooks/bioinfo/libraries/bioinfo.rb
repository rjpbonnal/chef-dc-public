class Chef
    class Recipe
        def bioinfo_dowload_and_cleandir(program)
            if program[:source]=~/\.git$/
                header = "Cloning #{program[:name]} from GitHub"
                bash header do
                    cwd node.bioinfo[:apps_download_directory]
                    if Dir.exists?(program[:name])
                        git_command = <<-EOH
                                        echo "Fetching from upstream"
                                        git fetch
                                        EOH
                    else
                        git_command = <<-EOH
                                        git clone #{program[:source]}
                                        EOH
                    end
                    if program[:git_revision]
                        git_command << <<-EOH
                        #{program[:git_revision]}
                        EOH
                    end
                    code <<-EOH
                    #{git_command}
                    cd #{program[:name]}
                    git archive --prefix #{program[:name]}-#{program[:version]}/ --format tar #{program[:git_commit] || 'HEAD'} | gzip > ../#{program[:name]}-#{program[:version]}.tar.gz
                    cd ..
                    rm -rf #{program[:name]}
                    EOH
                end
            else
                remote_file File.join(node.bioinfo[:apps_download_directory],program[:file]) do
                    source program[:source]
                    action :create_if_missing
                end 
            end
  
            directory File.join(node.bioinfo[:apps_directory],program[:name],program[:version]) do
                recursive true
                action :delete
            end

            directory File.join(node.bioinfo[:apps_directory],program[:name]) do
                recursive true
                action :create
            end
		end #bioinfo_dowload_cleandir

        def create_bioinformatic_profile
            file "/etc/profile.d/bioinformatics.sh" do
                owner "root"
                group "root"
                mode "644"
                action :create_if_missing
            end
        end #create_bioinformatic_profile

        def bioinformatic_install(program)
          header = "Installing #{program[:name]} version #{program[:version]}"
          bash header do
            cwd "#{node.bioinfo[:apps_directory]}/#{program[:name]}"
            code <<-EOH
            #{program[:unpack]} #{node.bioinfo[:apps_download_directory]}/#{program[:file]}
            mv #{program[:program_cache_dirname]} #{program[:version]}
            cd #{program[:version]} 
            #{yield if block_given?}        
            EOH
          end
        end #bioinformatic_install

        def create_module_program(program, hash_variables={})
            module_program_path = File.join(node.modules.module_path, program[:name])

            directory module_program_path do
                recursive true
                action :create
            end

            template File.join(module_program_path,program[:version]) do
                source "standard-mini-modules.erb"
                variables({:version => program[:version],
                            :root => File.join(node.bioinfo[:apps_directory], program[:name], program[:version])
                        }.merge(hash_variables))
            end
        end #create_module_program


	end #Recipe
end #Chef