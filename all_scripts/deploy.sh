#!/bin/bash

. "$(pwd)/all_scripts/hosts.txt"

TARGET="master"

for OPT in "$@"; do
  case $OPT in
    '--bundle' )
        FLAG_BUNDLE=1
        ;;
    * )
        TARGET=$1
        ;;
  esac
  shift
done

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

if [ $FLAG_BUNDLE ]; then
  BUNDLE_OPTION="--bundle"
else
  BUNDLE_OPTION=""
fi
WEB_COMMAND="hostname && ${LOAD_COMMAND} && /home/isucon/scripts/deploy_app.sh ${BUNDLE_OPTION}"
echo "Deploy app..."
echo "COMMAND: ${WEB_COMMAND}"
for i in ${WEB_HOSTS[@]}; do
  echo ""
  echo $i
  ssh "isucon@${i}" "${WEB_COMMAND}"
done
echo "Deployed app!"

echo ""
`pwd`/all_scripts/branch_status.sh
echo ""
`pwd`/all_scripts/healthcheck.sh
echo ""

echo '  ________   ________   _____ ______    ________   ___        _______   _________   _______      '
echo ' |\   ____\ |\   __  \ |\   _ \  _   \ |\   __  \ |\  \      |\  ___ \ |\___   ___\|\  ___ \     '
echo ' \ \  \___| \ \  \|\  \\ \  \\\__\ \  \\ \  \|\  \\ \  \     \ \   __/|\|___ \  \_|\ \   __/|    '
echo '  \ \  \     \ \  \\\  \\ \  \\|__| \  \\ \   ____\\ \  \     \ \  \_|/__   \ \  \  \ \  \_|/__  '
echo '   \ \  \____ \ \  \\\  \\ \  \    \ \  \\ \  \___| \ \  \____ \ \  \_|\ \   \ \  \  \ \  \_|\ \ '
echo '    \ \_______\\ \_______\\ \__\    \ \__\\ \__\     \ \_______\\ \_______\   \ \__\  \ \_______\'
echo '     \|_______| \|_______| \|__|     \|__| \|__|      \|_______| \|_______|    \|__|   \|_______|'
