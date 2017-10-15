#!/bin/bash

echo 'Update config file...'
  sudo cp "${HOME}/nginx.conf" /etc/nginx/nginx.conf
  sudo cp "${HOME}/my.conf" /etc/mysql/my.cnf
echo 'Updateed config file!'

echo 'restart services...'
  sudo systemctl restart nginx
  # Save cache
  # sudo systemctl restart mysql

  # Stop
  sudo systemctl stop isu.service

  # Update access log
  ./rotate.sh

  # Update
  sudo systemctl start isu.service
echo 'restarted!'
