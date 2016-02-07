node.bioinfo[:pyicoteo].each do |program|
      bioinfo_dowload_and_cleandir program

      bioinformatic_install program do
        <<-EOH
        python setup.py install
        EOH
      end

      create_bioinformatic_profile

      create_module_program program

end #each versionpython setup.py install