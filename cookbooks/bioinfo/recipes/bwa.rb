node.bioinfo[:bwa].each do |program|
  bioinfo_dowload_and_cleandir program
  
  bioinformatic_install program do
    str = <<-EOH
    make -j 4
    EOH
  end
  
  create_module_program program
end