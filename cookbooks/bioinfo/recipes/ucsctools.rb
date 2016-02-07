
package'libmysqlclient-dev'

node.bioinfo[:ucsctools].each do |program|
  bioinfo_dowload_and_cleandir program
  
  program_path = File.join node.bioinfo[:apps_directory],program[:name],program[:version]
  bioinformatic_install program do

    str = <<-EOH
    
    cd #{program_path}
export MACHTYPE=x86_64
   mkdir -p ~/bin/${MACHTYPE} 
   cd #{program_path}/src/lib 
   make 
   cd #{program_path}/src/utils/stringify 
   make 

cd #{program_path}/src/utils/bedClip 
   export MACHTYPE=x86_64 
   mkdir -p ~/bin/${MACHTYPE} 
   make

cd #{program_path}/src/utils/bedGraphToBigWig 
   export MACHTYPE=x86_64 
   mkdir -p ~/bin/${MACHTYPE} 
   make

cd #{program_path}/src/utils/wigCorrelate 
   export MACHTYPE=x86_64 
   mkdir -p ~/bin/${MACHTYPE} 
   make
cd #{program_path}
export MACHTYPE=x86_64 
   mv ~/bin/${MACHTYPE}/* #{program_path}/
rm -rf ~/bin/${MACHTYPE}


    EOH
  end
  
  create_module_program program
end


