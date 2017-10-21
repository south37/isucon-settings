#!/bin/bash

sudo mv "/var/log/nginx/access.log" "/var/log/nginx/`date +"%Y%m%d%H%M%S"`_access.log"
sudo systemctl restart nginx
