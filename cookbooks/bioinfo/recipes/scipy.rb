


node.bioinfo[:scipy].each do |program|
  bioinfo_download_and_cleandir program
  
  bioinformatic_install program 

  create_module_program program
end