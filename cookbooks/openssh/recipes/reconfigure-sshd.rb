# reconfigure sshd with desired defaults
ruby_block 'reconfigure_sshd' do
    block do
        f = Chef::Util::FileEdit.new("/etc/ssh/sshd_config")
        # don't allow login as root
        f.search_file_replace(/^PermitRootLogin yes/, 'PermitRootLogin no')
        # disable tunneled clear text passwords
        f.search_file_replace(/^#PasswordAuthentication yes/, 'PasswordAuthentication no')
        f.write_file
    end
    action :create
end

# restart sshd to reload configuration
service 'ssh' do
    provider Chef::Provider::Service::Upstart
    supports :status => true, :restart => true, :reload => true
    action :reload
end
