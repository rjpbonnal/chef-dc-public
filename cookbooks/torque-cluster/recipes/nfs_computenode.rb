# Adapted from http://blog.ajdecon.org/learning-chef-compute-cluster-with-slurm/


package("nfs-common")

# Make sure the diretory to be exported exists
node.nfs[:machines].each do |machine|
    directory machine[:mount_dir] do
        mode "0777"
        action :create
    end
end


file "/etc/fstab" do

    # Generate the new fstab lines
    new_lines = ""
    node.nfs[:machines].each do |machine| 
        new_lines = new_lines + "#{machine[:ip]}:#{machine[:source]}  #{machine[:mount_dir]}  #{machine[:type]}  #{machine[:options]}\n"
    end

    print "*** Mount line: #{new_lines}\n"

    # Get current content, check for duplication
    only_if do
        current_content = File.read('/etc/fstab')
        current_content.index(new_lines).nil?
    end

    print "*** Passed the conditional for current content\n"

    # Set up the file and content
    owner "root"
    group "root"
    mode  "0644"
    current_content = File.read('/etc/fstab')
    new_content = current_content + new_lines
    content new_content

end

execute "mount" do
    command "mount -a"
    action :run
end
