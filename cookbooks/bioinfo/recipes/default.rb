#
# Cookbook Name:: bioinfo
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "unzip"


directory "/opt/cache" do
  owner "root"
  group "root"
  action :create
end

package "hmmer"
package "hmmer-doc"

include_recipe "bioinfo::java"
include_recipe "bioinfo::tophat"
include_recipe "bioinfo::cufflinks"
include_recipe "bioinfo::bedtools"
include_recipe "bioinfo::picard"
include_recipe "bioinfo::samtools"
include_recipe "bioinfo::tabix"
include_recipe "bioinfo::star"
include_recipe "bioinfo::R"
include_recipe "bioinfo::R-packages"
include_recipe "bioinfo::phylocsf" #questo dipende dalla ricetta apt (fondo del file) in cui e' definito repository per opam/ocal
include_recipe "bioinfo::macs" #questa ricetta include l'installazione di due versioni di MAC 1.4.2 e 2.0.10 e' totalmente custom
include_recipe "bioinfo::htseq"
include_recipe "bioinfo::kyotocabinet"
include_recipe "bioinfo::ruby"