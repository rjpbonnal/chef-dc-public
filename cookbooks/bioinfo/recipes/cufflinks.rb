

# ruby_block "Install all Cufflinks versions" do
#   block do
    node.bioinfo[:cufflinks].each do |program|

      bioinfo_dowload_and_cleandir program

      bioinformatic_install program
      
      create_bioinformatic_profile

      create_module_program program

    end #each version
#   end #block
# end #ruby_block