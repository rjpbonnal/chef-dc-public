package "pkg-config"
package "libxml2-dev"
package "libcurl4-openssl-dev"

node.bioinfo[:R].each do |program|
    
    r_packages_filename = File.join(Chef::Config[:file_cache_path],"#{program[:name]}_#{program[:version]}_packages.R")
	template r_packages_filename do
		user "root"
		owner "root"
		mode "644"
		source "R-packages.erb"
	end

	header  = "Installing INGM Bio Informatic packages for #{program[:name]} version #{program[:version]}"
	bash header do
		code <<-EOH
		source /etc/profile.d/modules_bash.sh
		module load #{program[:name]}/#{program[:version]}
		Rscript #{r_packages_filename}
		EOH
	end
end