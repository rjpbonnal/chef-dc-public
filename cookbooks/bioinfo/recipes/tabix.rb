node.bioinfo[:tabix].each do |program|
      bioinfo_dowload_and_cleandir program

      bioinformatic_install program do
        <<-EOH
        make -j 4
        EOH
      end

      create_bioinformatic_profile

      create_module_program program

end #each version
