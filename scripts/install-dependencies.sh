#!/usr/bin/env bash
# Install application runtime dependencies
# Consumed by "vagrant up" and "packer build"
set -e

#
# Install
#

# core reqs
yum -y install openssl findutils epel-release

# ruby
yum -y install \
  gcc-c++ patch readline readline-devel zlib zlib-devel subsersion \
  libffi-devel openssl-devel make bzip2 autoconf automake autoconf \
  libtool bison libxml2 libxml2-devel libxslt libxslt-devel git nodejs

[ -d /opt/ruby-build ] || \
  git clone https://github.com/sstephenson/ruby-build.git /opt/ruby-build
PREFIX=/usr /opt/ruby-build/install.sh
ruby-build 2.2.3 /usr
gem install bundler --no-document

#
# Configure
#

#
# Manage
#

