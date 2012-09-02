#!/bin/bash

CHEF_ETC_DIR=/etc/chef
CHEF_LIB_DIR=/var/lib/chef
CHEF_SOLO_CFG=${CHEF_LIB_DIR}/solo.rb
CHEF_SOLO_JSON=${CHEF_LIB_DIR}/solo.json

# install chef from the opscode deb repository
apt-get -y install debconf-utils python-software-properties
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 83EF826A
add-apt-repository "deb http://apt.opscode.com/ precise-0.10 main"
apt-get update
echo "chef	chef/chef_server_url	string	none" | debconf-set-selections
apt-get -y install opscode-keyring chef

# create a symlink of chef-solo configuration file to its default location
ln -s ${CHEF_SOLO_CFG} ${CHEF_ETC_DIR}

# run chef-solo with the post-installation run list
chef-solo -j ${CHEF_SOLO_JSON}
