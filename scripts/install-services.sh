#!/usr/bin/env bash
# Install external service dependencies
# Consumed by 'vagrant up'
set -e

#
# Dev-only services
#

docker ps | grep -q polipo || docker run --name polipo -d -p 8123:8123 clue/polipo proxyAddress=0.0.0.0
echo 'export http_proxy=http://localhost:8123' >> /etc/profile.d/http_proxy.sh
echo 'export https_proxy=http://localhost:8123' >> /etc/profile.d/http_proxy.sh
chmod a+x /etc/profile.d/http_proxy.sh

#
# Production services
#
# * IMPORTANT *
# If you add something here, chances are
# you'll need to let ops know about it.
#

docker ps | grep -q redis || docker run --name redis -d -p 6379:6379 redis
docker ps | grep -q memcached || docker run --name memcached -d -p 11211:11211 memcached
