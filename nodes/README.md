Generate Node Backup
====================

    for x in `knife node list`; do knife node show ${x} -Fj > nodes/${x}-short.json;  knife node show ${x} -l -Fj > nodes/${x}-long.json; done


Loading Data Short
==================

Scrivere uno script per caricare in automatico tutti i nodi e i cliente, magari anche dopo fare la registrazione in automatico con il bootstrap


Bootstrapping 
=============

    knife bootstrap ip.your.server -r 'role[base_network_users]' -d ubuntu12.04-ingm -x admin_user -P admin_password --sudo

Configure Nodes for Torque/PBS
==============================

    knife ssh "role:torque-computenode" "sudo chef-client" -x admin_user -P admin_password	

Creazione degli utenti
======================

dopo che si e' creato un utente bisogna create le chiavi ssh e per ogni utente copiare

    ssh-keygen -t rsa
    cp ~/.ssh/id_rsa.pub ~/.ssh/authorized_keys
