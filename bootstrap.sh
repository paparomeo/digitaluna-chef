#!/bin/bash

# copy ssh id to remote host to start doing public key authentication
ssh-copy-id $1
# apt update + dist-upgrade + install git + clone digitaluna-chef
# 'ssh -t' forces pseudo-tty to allow typing the remote sudo password
ssh -t $1 'sudo bash -c "apt-get update && apt-get dist-upgrade && apt-get -y install && git clone git://github.com/pmcnr/digitaluna-chef.git /var/chef && /var/chef/install.sh"'