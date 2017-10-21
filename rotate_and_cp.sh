#!/bin/bash

$logfile="`date +"%Y%m%d%H%M%S"`_access.log"
sudo mv "/var/log/nginx/access.log" "/var/log/nginx/$logfile"
sudo cp "/var/log/nginx/$logfile" "log/$logfile"
sudo systemctl restart nginx
