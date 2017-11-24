#!/bin/bash

. "$(pwd)/all_scripts/hosts.txt"

TAIL_LENGTH=10
while [ "$1" != "" ]; do
  case "$1" in
    '-n' )
        TAIL_LENGTH=$2
        shift 2
        ;;
    * )
        shift 1
        ;;
  esac
done

NGINX_COMMAND="hostname && echo '' && ( \$(pwd)/scripts/error_log.sh | tail -n ${TAIL_LENGTH} )"
for i in ${NGINX_HOSTS[@]}; do
  echo ""
  echo $i
  ssh "${ISUCONUSER}@${i}" "${NGINX_COMMAND}"
done
