#!/bin/bash

. "$(pwd)/scripts/var.txt"

echo 'Update config file...'
  echo "${SUDOPASS}" | sudo -S cp "$HOME/redis.conf" /etc/redis/redis.conf
echo 'Updateed config file!'

echo 'Restart redis...'
  echo "${SUDOPASS}" | sudo -S systemctl restart redis
echo 'Restarted!'
