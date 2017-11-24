#!/bin/bash

. "$(pwd)/scripts/var.txt"

echo "${SUDOPASS}" | sudo -S mv "/var/log/nginx/access.log" "/var/log/nginx/`date +"%Y%m%d%H%M%S"`_access.log"
echo "${SUDOPASS}" | sudo -S systemctl restart nginx
