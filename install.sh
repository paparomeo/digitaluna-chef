#!/bin/bash

apt-get -y install python-software-properties
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 83EF826A
add-apt-repository "deb http://apt.opscode.com/ precise-0.10 main"
apt-get update
apt-get -y install opscode-keyring chef