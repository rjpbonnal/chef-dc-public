package "zlib1g"
package "zlib1g-dev"
package 'python-pip'
package 'xsltproc'


node.bioinfo[:casava].each do |program|

  bioinfo_dowload_and_cleandir program
  program_root_path = File.join node.bioinfo[:apps_directory],program[:name],program[:version]

  bioinformatic_install program do
    str = <<-EOH
    pip install PyXML
    apt-get -q -y install libxml2-dev libxslt1-dev python-dev
    apt-get -q -y install libtiff4 libtiff4-dev
    cp /usr/lib/x86_64-linux-gnu/libz.so /usr/lib
    cp /usr/lib/x86_64-linux-gnu/libpthread* /usr/lib
    ln -s /usr/lib/x86_64-linux-gnu/libbz2* /usr/lib

    mkdir CASAVA-1.8.2-build
    cd CASAVA-1.8.2-build
    
    sudo /opt/CASAVA/1.8.2/src/configure -prefix=#{program_root_path}
    make -j 8
    make install
    EOH
  end
  
  create_bioinformatic_profile

  create_module_program program

end #each version

#prerequisiti
#GNU make (3.81 recommended) Ok
#Perl (>= 5.8)               Ok
#Python (>=2.3 and <=2.6) io ho 2.7
#gnuplot
#apt-get install libxml2-dev libxslt1-dev python-dev
#PyXML =>pip install PyXML   
#apt-get install libtiff4 libtiff4-dev
#
