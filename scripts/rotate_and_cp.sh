#!/bin/bash

. "$(pwd)/scripts/var.txt"

LOGFILE="`date +"%Y%m%d%H%M%S"`_access.log"
echo "${SUDOPASS}" | sudo -S mv "/var/log/nginx/access.log" "/var/log/nginx/$LOGFILE"
echo "${SUDOPASS}" | sudo -S cp "/var/log/nginx/$LOGFILE" "log/$LOGFILE"
echo "${SUDOPASS}" | sudo -S chown ${ISUUSER}:${ISUUSER} "log/$LOGFILE"
echo "${SUDOPASS}" | sudo -S systemctl restart nginx
