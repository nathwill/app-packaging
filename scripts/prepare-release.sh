#!/usr/bin/env bash
# release-specific build step that runs before either
# the app is uploaded or dependencies are installed
set -e

BUILD_ROOT=/build

#
# Install
#
yum -y --releasever=7 --nogpg \
  --installroot=${BUILD_ROOT} install \
  systemd passwd yum centos-release openssl

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

chroot ${BUILD_ROOT} useradd -r -s /sbin/nologin -u 1013 -g 1013 \
  -r -d /srv/app -c 'Default Application User' deploy

#
# Manage
#
