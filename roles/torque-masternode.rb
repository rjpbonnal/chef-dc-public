name "torque-masternode"
description "Torque Master Node"
run_list "recipe[torque-cluster::nfs_computenode]",
         "recipe[torque-cluster::sendmail]",
         "recipe[torque-cluster::torque_packaging]",
         "recipe[torque-cluster::torque-masternode]"