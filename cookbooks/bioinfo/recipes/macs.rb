#questa e' una installazione un Custom da rivedere per renderla piu uniforme alle altre.
# il problema qui e' il custom download e versione di MACS


package "python-numpy"
package "python-dev"

node.bioinfo[:macs].each do |program|
  bioinfo_dowload_and_cleandir program

  program_root_path = File.join node.bioinfo[:apps_directory],program[:name],program[:version]

  bioinformatic_install program do
     <<-EOH
      python setup.py install --prefix #{program_root_path}
    EOH
  end

  create_bioinformatic_profile

#si puo semplificare ancora molto
  create_module_program program, {
                                  :remove_root => File.join(node.bioinfo[:apps_directory], program[:name],program[:conflict_version]),
                                  :previous_module => File.join(program[:name],program[:conflict_version])
                                }

end #each program