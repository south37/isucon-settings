#!/bin/bash

. "$(pwd)/all_scripts/hosts.txt"

TARGET="master"

if [ "$#" = 1 ]; then
  echo "deploy $1..."
  TARGET="$1"
fi

NGINX_COMMAND="hostname && git fetch origin ${TARGET} && git checkout ${TARGET} && git pull origin ${TARGET} && /home/isucon/scripts/deploy_nginx.sh"
echo "Deploy nginx..."
echo "COMMAND: ${NGINX_COMMAND}"
for i in ${NGINX_HOSTS[@]}; do
  echo ""
  echo $i
  ssh "isucon@${i}" "${NGINX_COMMAND}"
done
echo "Deployed nginx!"
echo ""

WEB_COMMAND="hostname && git fetch origin ${TARGET} && git checkout ${TARGET} && git pull origin ${TARGET} && /home/isucon/scripts/deploy_service.sh && /home/isucon/scripts/deploy_app.sh"
echo "Deploy app..."
echo "COMMAND: ${WEB_COMMAND}"
for i in ${WEB_HOSTS[@]}; do
  echo ""
  echo $i
  ssh "isucon@${i}" "${WEB_COMMAND}"
done
echo "Deployed app!"
