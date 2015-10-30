#!/usr/bin/env bash
# Release-specific steps
# Consumed by 'packer build'
set -e

APP_ROOT=/srv/app/current

BUNDLE_GEMFILE=${APP_ROOT}/Gemfile \
  BUNDLE_JOBS=2 \
  BUNDLE_PATH=${APP_ROOT}/bundle \
  bundle install --deployment --quiet \
  --path ${APP_ROOT}/bundle \
  --without development test

chown -R deploy: ${APP_ROOT}
