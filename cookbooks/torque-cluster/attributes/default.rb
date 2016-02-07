
default[:torque][:version] = "4.2.5"
default[:torque][:filename] = "torque-4.2.5.tar.gz"
default[:torque][:adminuser] = "YOURADMINUSR"
default[:torque][:queue_name] = "bio"

default[:maui][:version] = "3.3.1"
default[:maui][:filename] = "maui-3.3.1.tar.gz"

default[:sendmail][:SMART_HOST] = "your.smart.host"

default[:ingm][:packages_file_cache_path] = "/mnt/hpcapps-archive"
default[:ingm][:mail_domain] = 'your.mail.domain'
default[:ingm][:domain] = 'your.domain'

default[:nfs][:machines] = [
	{:ip => "your.ip.mounter", :source =>"/SpeedPool/Home", :mount_dir => "/mnt/home", :type => "nfs", :options => "nfsvers=3,noacl,nocto,intr,rsize=65536,wsize=65536 0 0" },
]

#recipe configures computenodes with DirectFlow client
default[:dflow][:machines] = [
	{:ip => "panfs://your.ip.panfs", :source =>"/rnd", :mount_dir => "/mnt/rnd", :type => "panfs", :options => "rw,noauto,panauto,rmlist=(ips,ips,ips),statahead-level=4,iscsi-sock-rsize=40960,iscsi-sock-wsize=40960,dir-caching-threshold=1368064,statahead-max-inflight=512  0 0" },
  ]
