node.dbs[:kyotocabinet].each do |program|
      bioinfo_dowload_and_cleandir program

      bioinformatic_install program 

      bioinformatic_install program do
        <<-EOH
          ./configure --prefix=#{File.join(node.bioinfo[:apps_directory],program[:name],program[:version])} –enable-zlib –enable-lzo –enable-lzma
          make -j 4
          make install
        EOH
      end

      create_bioinformatic_profile

      create_module_program program, {:cplus_include_path => '.', :pkgconfig_path => 'lib/pkgconfig' }

end #each version