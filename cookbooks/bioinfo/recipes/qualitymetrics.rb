node.bioinfo[:qualitymetrics].each do |program|
  bioinfo_dowload_and_cleandir program
  
  bioinformatic_install program do
    str = <<-EOH
    
    R CMD INSTALL spp_1.10.X.tar.gz
    EOH
  end
  
  create_module_program program
end