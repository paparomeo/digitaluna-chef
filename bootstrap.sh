#!/bin/bash

CHEF_REPO_URL=git://github.com/pmcnr/digitaluna-chef
CHEF_LIB_DIR=/var/lib/chef
CHEF_INSTALL_SCRIPT=${CHEF_LIB_DIR}/install.sh

# copy ssh id to remote host to start doing public key authentication
ssh-copy-id $1
# apt update + dist-upgrade + install git + clone digitaluna-chef
# 'ssh -t' forces pseudo-tty to allow typing the remote sudo password
ssh -t $1 "sudo bash -c \"apt-get update && apt-get dist-upgrade && apt-get -y install git && rm -rf ${CHEF_DATA_DIR} && git clone ${CHEF_REPO_URL} ${CHEF_LIB_DIR} && ${CHEF_INSTALL_SCRIPT}\""
