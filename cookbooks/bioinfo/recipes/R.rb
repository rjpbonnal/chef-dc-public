%w(fort77 zip unzip libpaper-utils xdg-utils libblas3gf libbz2-1.0 libc6 libcairo2 libgfortran3 libglib2.0-0 
  libgomp1 libjpeg8 liblapack3gf liblzma5 libpango1.0-0 libpcre3 libpng12-0 libreadline6 libtiff4 libx11-6 
  libxt6 tcl8.5 tk8.5 zlib1g ucf build-essential gcc g++ gfortran libblas-dev liblapack-dev  libncurses5-dev 
  libreadline-dev libjpeg-dev libpcre3-dev libpng12-dev zlib1g-dev libbz2-dev dpatch cdbs debhelper 
  texlive-base texlive-latex-base texlive-generic-recommended texlive-fonts-recommended texlive-fonts-extra 
  texlive-extra-utils texlive-latex-recommended texlive-latex-extra texinfo texi2html).each do |pkg|
  package pkg
end   

node.bioinfo[:R].each do |program|

  bioinfo_dowload_and_cleandir program

  bioinformatic_install program do
    <<-EOH
    ./configure --with-x=no --enable-R-shlib --prefix=#{File.join(node.bioinfo[:apps_directory],program[:name],program[:version])}
    make -j 4
    make -j 4 check
    make -j 4 pdf
    make -j 4 info
    make install
    EOH
  end

  
  create_bioinformatic_profile

  create_module_program program

end #each version



