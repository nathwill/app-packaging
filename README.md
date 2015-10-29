# My-App

The greatest app ever. It tells you what time it is! Sweet biscuits!

# Developing

It's as easy as `vagrant up`! Go nuts!

# Releasing

## Build the release artifact

Within the development environment, just run `packer build my-app-packer.json`.

## Ship it

On your workstation, run `bundle exec cap <environment> deploy`.
