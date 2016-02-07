node.bioinfo[:tophat].each do |program|
      bioinfo_dowload_and_cleandir program

      bioinformatic_install program 

      create_bioinformatic_profile

      create_module_program program

end #each version
