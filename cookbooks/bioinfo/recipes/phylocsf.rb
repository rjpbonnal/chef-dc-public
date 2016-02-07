
package "ocaml"
package "opam"
package "libgsl0-dev"
package "make"
package "m4"
package "camlp4-extra"
package "git"


node.bioinfo[:phylocsf].each do |program|



  bash "Install opam for PhyloCSF" do
    code <<-EOH
      opam init -y
      eval `opam config env`
      opam install -y batteries ocaml+twt gsl
    EOH
  end

  bioinfo_dowload_and_cleandir program


  bioinformatic_install program do
    str = <<-EOH
    eval `opam config env`
    make -j 4
    EOH
  end

  create_bioinformatic_profile

  create_module_program program

end