#!/bin/bash

. "$(pwd)/all_scripts/hosts.txt"

TARGET="master"

if [ "$#" = 1 ]; then
  echo "deploy $1..."
  TARGET="$1"
fi

LOAD_COMMAND="git checkout master && git pull origin master && git fetch origin ${TARGET} && git checkout ${TARGET} && git pull origin ${TARGET} && git merge master"

NGINX_COMMAND="hostname && ${LOAD_COMMAND} && /home/isucon/scripts/deploy_nginx.sh"
echo "Deploy nginx..."
echo "COMMAND: ${NGINX_COMMAND}"
for i in ${NGINX_HOSTS[@]}; do
  echo ""
  echo $i
  ssh "isucon@${i}" "${NGINX_COMMAND}"
done
echo "Deployed nginx!"
echo ""

WEB_COMMAND="hostname && ${LOAD_COMMAND} && /home/isucon/scripts/deploy_app.sh"
echo "Deploy app..."
echo "COMMAND: ${WEB_COMMAND}"
for i in ${WEB_HOSTS[@]}; do
  echo ""
  echo $i
  ssh "isucon@${i}" "${WEB_COMMAND}"
done
echo "Deployed app!"

`pwd`/all_scripts/healthcheck.sh
`pwd`/all_scripts/branch_status.sh

echo '  ________   ________   _____ ______    ________   ___        _______   _________   _______      '
echo ' |\   ____\ |\   __  \ |\   _ \  _   \ |\   __  \ |\  \      |\  ___ \ |\___   ___\|\  ___ \     '
echo ' \ \  \___| \ \  \|\  \\ \  \\\__\ \  \\ \  \|\  \\ \  \     \ \   __/|\|___ \  \_|\ \   __/|    '
echo '  \ \  \     \ \  \\\  \\ \  \\|__| \  \\ \   ____\\ \  \     \ \  \_|/__   \ \  \  \ \  \_|/__  '
echo '   \ \  \____ \ \  \\\  \\ \  \    \ \  \\ \  \___| \ \  \____ \ \  \_|\ \   \ \  \  \ \  \_|\ \ '
echo '    \ \_______\\ \_______\\ \__\    \ \__\\ \__\     \ \_______\\ \_______\   \ \__\  \ \_______\'
echo '     \|_______| \|_______| \|__|     \|__| \|__|      \|_______| \|_______|    \|__|   \|_______|'
