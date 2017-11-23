#!/bin/bash

LOGFILE="`date +"%Y%m%d%H%M%S"`_access.log"
echo "isucon" | sudo -S mv "/var/log/nginx/access.log" "/var/log/nginx/$LOGFILE"
echo "isucon" | sudo -S cp "/var/log/nginx/$LOGFILE" "log/$LOGFILE"
echo "isucon" | sudo -S chown isucon:isucon "log/$LOGFILE"
echo "isucon" | sudo -S systemctl restart nginx
