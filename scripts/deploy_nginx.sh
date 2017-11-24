#!/bin/bash

. "$(pwd)/scripts/var.txt"

echo 'Rotate log file...'
  "$HOME/scripts/rotate.sh"
echo 'Rotated log file!'

echo 'Update config file...'
  echo "${SUDOPASS}" | sudo -S cp "$HOME/nginx.conf" /etc/nginx/nginx.conf
echo 'Updateed config file!'

echo 'Restart nginx...'
  echo "${SUDOPASS}" | sudo -S systemctl restart nginx.service
echo 'Restarted!'
