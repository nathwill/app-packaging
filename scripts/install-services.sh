#!/usr/bin/env bash
# Install external service dependencies
# If you add something here, tell ops!

set -e

docker run --name redis -d -p 6379:6379 redis
docker run --name memcached -d -p 11211:11211 memcached
