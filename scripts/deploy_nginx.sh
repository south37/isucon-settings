#!/bin/bash

echo 'Rotate log file...'
  "$HOME/scripts/rotate.sh"
echo 'Rotated log file!'

echo 'Update config file...'
  echo "${SUDOPASS}" | sudo -S cp "$HOME/nginx.conf" /etc/nginx/nginx.conf
  # sudo cp "$HOME/redis.conf" /etc/redis/redis.conf
  # sudo cp "$HOME/my.conf" /etc/mysql/my.cnf
echo 'Updateed config file!'

echo 'Restart nginx...'
  echo "${SUDOPASS}" | sudo -S systemctl restart nginx.service
echo 'Restarted!'
