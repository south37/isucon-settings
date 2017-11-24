#!/bin/bash

. "$(pwd)/all_scripts/hosts.txt"

NGINX_COMMAND="hostname && echo '' && ( /home/isucon/scripts/error_log.sh | tail -n ${TAIL_LENGTH} )"
for i in ${NGINX_HOSTS[@]}; do
  echo ""
  echo $i
  ssh "isucon@${i}" "${NGINX_COMMAND}"
done
