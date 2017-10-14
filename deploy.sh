#!/bin/bash

echo 'Update config file...'
  echo "isucon" | sudo cp "${HOME}/nginx.conf" /etc/nginx/nginx.conf
  echo "isucon" | sudo cp "${HOME}/my.conf" /etc/mysql/my.cnf
echo 'Updateed config file!'

echo 'restart services...'
  echo "isucon" | sudo systemctl restart nginx
  # Save cache
  # echo "isucon" | sudo systemctl restart mysql

  # Stop
  echo "isucon" | sudo systemctl stop isu.service

  # Update access log
  ./rotate.sh

  # Update
  echo "isucon" | sudo systemctl start isu.service
echo 'restarted!'
