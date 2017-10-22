#!/bin/bash

echo 'Rotate log file...'
  ./rotate.sh
echo 'Rotated log file!'

echo 'Update config file...'
  sudo cp "$HOME/nginx.conf" /etc/nginx/nginx.conf
  # sudo cp "$HOME/redis.conf" /etc/redis/redis.conf
  # sudo cp "$HOME/my.conf" /etc/mysql/my.cnf
echo 'Updateed config file!'

if [ "$1" = "--bundle" ]; then
  echo 'Start bundle install...'
  cd "$HOME/webapp/ruby"
  bundle install
  cd "$HOME"
  echo 'bundle install finished!'
fi

echo 'Restart services...'
  sudo systemctl restart nginx.service
  # sudo systemctl restart redis.service
  # Save cache
  # sudo systemctl restart mysql.service
  sudo systemctl restart isu.ruby.service
echo 'Restarted!'
