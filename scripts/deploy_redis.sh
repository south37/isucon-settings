#!/bin/bash

echo 'Update config file...'
  sudo cp "$HOME/redis.conf" /etc/redis/redis.conf
echo 'Updateed config file!'

echo 'Restart redis...'
  sudo systemctl restart redis
echo 'Restarted!'
