#!/usr/bin/env bash
set -e

APP_ROOT=/my-app

BUNDLE_GEMFILE=$APP_ROOT/Gemfile \
  BUNDLE_JOBS=2 \
  BUNDLE_PATH=$APP_ROOT/bundle \
  bundle install --deployment --quiet \
  --path $APP_ROOT/bundle \
  --without development test

systemctl enable my-app.service
