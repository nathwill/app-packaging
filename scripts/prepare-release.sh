#!/usr/bin/env bash
# prepare the cleanroom build target
# consumed by 'packer build'
set -e

BUILD_ROOT=/build

#
# Install
#
yum -y --releasever=7 --nogpg \
  --installroot=${BUILD_ROOT} install \
  systemd passwd yum centos-release

mknod -m 0644 ${BUILD_ROOT}/dev/random c 1 8
mknod -m 0644 ${BUILD_ROOT}/dev/urandom c 1 9

#
# Configure
#
echo | tee ${BUILD_ROOT}/etc/resolv.conf <<-EOF
search iad01.treehouse treehouse
nameserver 208.85.151.240
nameserver 199.91.168.70
nameserver 8.8.8.8
options timeout:2
EOF

chroot ${BUILD_ROOT} useradd -r -s /sbin/nologin -u 1013 -g 0 \
  -r -d /srv/app -c 'Default Application User' deploy

#
# Manage
#
