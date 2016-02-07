name "torque-computenode"
description "Torque Compute Node"
run_list "recipe[torque-cluster::nfs_computenode]",
         "recipe[torque-cluster::torque-computenode]",
         "recipe[bioinfo]"