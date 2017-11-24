#!/bin/bash

. "$(pwd)/all_scripts/hosts.txt"

TAIL_LENGTH=10

for OPT in "$@"; do
  case $OPT in
    '-n' )
        TAIL_LENGTH=$2
        shift 2
        ;;
  esac
  shift
done

COMMAND="hostname && ( /home/isucon/scripts/log_app.sh | tail -n ${TAIL_LENGTH} )"
for i in ${HOSTS[@]}; do
  echo ""
  echo $i
  ssh "isucon@${i}" "${COMMAND}"
done
echo ""
