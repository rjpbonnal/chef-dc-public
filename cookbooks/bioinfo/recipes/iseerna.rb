# note tecniche:
# il file iSeeRNA va modificato alla riga 44 in modo che la referenza ai sotto programmi sia corretta, visto che sposteremo il programma in bin deve essere cambiata la riga cosi:
# my $prg = "$root/bin";
# in
# my $prg = "$root";



node.bioinfo[:iseerna].each do |program|
  bioinfo_dowload_and_cleandir program
  
  bioinformatic_install program do
    str = <<-EOH
    chmod -R a+rX .
    sed -i.bak -e 's/my $prg = "$root\/bin";/my $prg = "$root";/g' iSeeRNA
    mv iSeeRNA bin/
    EOH
  end
  
  create_module_program program
end #each version