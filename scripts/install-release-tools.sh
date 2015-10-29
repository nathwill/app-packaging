#!/usr/bin/env bash
# Install release tooling
set -e

# Install
curl -sSL https://get.docker.com/ | sh
yum -y install unzip
curl -sS -L https://dl.bintray.com/mitchellh/packer/packer_0.8.6_linux_amd64.zip -o /tmp/packer.zip
unzip /tmp/packer.zip -d /usr/local/bin

# Configure
usermod -a -G docker vagrant
echo 'cd /vagrant' >> /home/vagrant/.bashrc

# Manage
systemctl enable docker.service
systemctl start docker.service
