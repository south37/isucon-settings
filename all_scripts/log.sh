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

COMMAND="hostname && ( /home/isucon/scripts/log_app.sh | tail -n ${TAIL_LENGTH} )"
for i in ${HOSTS[@]}; do
  echo ""
  echo $i
  ssh "isucon@${i}" "${COMMAND}"
done
echo ""
