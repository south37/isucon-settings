#!/bin/bash

. "$(pwd)/all_scripts/hosts.txt"

NGINX_COMMAND="hostname &&  \$(pwd)/scripts/deploy_nginx.sh"
echo "Deploy nginx..."
echo "COMMAND: ${NGINX_COMMAND}"
for i in ${NGINX_HOSTS[@]}; do echo "" && echo $i; ssh "${ISUCONUSER}@${i}" "${NGINX_COMMAND}"; done
echo "Deployed nginx!"
echo ""

WEB_COMMAND="hostname && \$(pwd)/scripts/deploy_app.sh"
echo "Deploy app..."
echo "COMMAND: ${WEB_COMMAND}"
for i in ${WEB_HOSTS[@]}; do echo "" && echo $i; ssh "${ISUCONUSER}@${i}" "${WEB_COMMAND}"; done
echo "Deployed app!"
