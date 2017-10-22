#!/bin/bash

LOGFILE="`date +"%Y%m%d%H%M%S"`_access.log"
sudo mv "/var/log/nginx/access.log" "/var/log/nginx/$LOGFILE"
sudo cp "/var/log/nginx/$LOGFILE" "log/$LOGFILE"
sudo chown isucon:isucon "log/$LOGFILE"
sudo systemctl restart nginx
