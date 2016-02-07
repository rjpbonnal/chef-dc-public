node.bioinfo[:picard].each do |program|
  bioinfo_dowload_and_cleandir program
  
  bioinformatic_install program
  
end #each version
