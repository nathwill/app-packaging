#!/usr/bin/env bash
# Install external service dependencies

set -e

# Install
yum -y install epel-release
yum -y install redis

# Configure


# Manage
systemctl enable redis.service
systemctl start redis.service
