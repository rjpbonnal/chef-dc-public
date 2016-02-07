# name "ensembl"
# description "Installa una macchina per replicare il database di ensembl"
# run_list "recipe[ensembl-source]",
#          "recipe[ensembl-config]"