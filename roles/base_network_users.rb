name "base_network_users"
description "Configurazione NIS e servizi base di rete "
run_list "recipe[apt]",
         "recipe[ntp]", 
         "recipe[line]", 
         "recipe[nfs]", 
         "recipe[nis]", 
         "recipe[openssh]", 
         "recipe[common_admin]"
