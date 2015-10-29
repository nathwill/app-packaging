#!/usr/bin/env bash
set -e

yum -y --releasever=7 --nogpg \
  --installroot=/build install \
  systemd passwd yum centos-release openssl

echo | tee /build/etc/resolv.conf <<-EOF
search iad01.treehouse treehouse
nameserver 208.85.151.240
nameserver 199.91.168.70
nameserver 8.8.8.8
options timeout:2
EOF
