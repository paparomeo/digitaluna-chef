#!/bin/bash

apt-get -y install debconf-utils python-software-properties
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 83EF826A
add-apt-repository "deb http://apt.opscode.com/ precise-0.10 main"
apt-get update
echo "chef chef/chef_server_url string none" | debconf-set-selections
apt-get -y install opscode-keyring chef
