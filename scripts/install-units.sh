#!/usr/bin/env bash
# Sets up the unit files for our app

for unit in my-app.service restart-my-app.service hard-restart-my-app.service; do
  cp /vagrant/config/${unit} /etc/systemd/system/${unit}
end

for unit in my-app.path restart-my-app.path hard-restart-my-app.path; do
  cp /vagrant/config/${unit} /etc/systemd/system/${unit}
  systemctl enable ${unit}
end
  
