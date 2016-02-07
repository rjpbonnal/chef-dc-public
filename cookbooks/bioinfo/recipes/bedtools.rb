package "zlib1g"
package "zlib1g-dev"

node.bioinfo[:bedtools].each do |program|

  bioinfo_dowload_and_cleandir program

  bioinformatic_install program do
    str = <<-EOH
    make -j 4
    EOH
  end
  
  create_bioinformatic_profile

  create_module_program program

end #each version
