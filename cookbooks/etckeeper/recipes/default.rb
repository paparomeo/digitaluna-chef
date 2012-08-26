PACKAGE = 'etckeeper'

# install package
package PACKAGE do
    action :install
end

# change the VCS that etckeeper uses from the distribution default to git
ruby_block 'change_vcs_to_git' do
    block do
        f = Chef::Util::FileEdit.new("/etc/#{PACKAGE}/#{PACKAGE}.conf")
        f.search_file_replace(/^VCS=/, '#VCS=')
        f.search_file_replace(/^#VCS="git"/, 'VCS="git"')
        f.write_file
    end
    action :create
end

# initialise the git repository for etckeeper
execute 'etckeeper_init' do
    command 'etckeeper init'
    creates '/etc/.git'
    action :run
end

# commit the base version of /etc
execute 'etckeeper_initial_commit' do
    command 'etckeeper commit "Base version."'
    action :run
end
