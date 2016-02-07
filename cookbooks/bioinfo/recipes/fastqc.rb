node.bioinfo[:fastqc].each do |program|
  bioinfo_dowload_and_cleandir program
  program_root_path = File.join node.bioinfo[:apps_directory],program[:name],program[:version]
  bioinformatic_install program do
    str = <<-EOH
    cd #{program_root_path} &&\
    chmod +x fastqc &&\
    ln -s /opt/fastqc /usr/local/bin/fastqc
    EOH
  end
  
  create_module_program program
end #each version