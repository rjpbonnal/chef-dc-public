

node.bioinfo[:rpy].each do |program|
  bioinfo_dowload_and_cleandir program

  program_root_path = File.join node.bioinfo[:apps_directory],program[:name],program[:version]


  bioinformatic_install program do
    str = <<-EOH

 	python setup.py build --r-home #{node.bioinfo[:apps_directory]}/R/3.0.2/lib install --prefix=#{program_root_path}
    EOH
  end

  create_bioinformatic_profile

  create_module_program program

end

