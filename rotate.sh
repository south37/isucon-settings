#!/bin/bash

mv "$HOME/webapp/var/log/nginx/access_kataribe.log" "$HOME/webapp/var/log/nginx/`date +"%Y%m%d%H%M%S"`_access_kataribe.log"
touch "$HOME/webapp/var/log/nginx/access_kataribe.log"
