package "libncurses5"
package "libncurses5-dev"
package "zlib1g"
package "zlib1g-dev"

node.bioinfo[:samtools].each do |program|

  bioinfo_dowload_and_cleandir program

  bioinformatic_install program do
    <<-EOH
    make -j 4
    EOH
  end
  
  create_module_program program #source => samtools-modules.erb

end #each version
