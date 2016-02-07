
package "build-essential"
package "python2.7-dev"
package "python-numpy"
package "python-matplotlib"


node.bioinfo[:htseq].each do |program|

  bioinfo_dowload_and_cleandir program

  program_root_path = File.join node.bioinfo[:apps_directory],program[:name],program[:version]


  bioinformatic_install program do
    str = <<-EOH
    python setup.py build
    python setup.py install --prefix=#{program_root_path}
    EOH
  end

  create_bioinformatic_profile

  create_module_program program

end