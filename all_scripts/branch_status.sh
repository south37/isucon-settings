#!/bin/bash

HOST1="54.238.174.46"
HOST2="13.114.230.223"
HOST3="54.250.245.52"
HOST4="54.199.141.147"
HOST5="54.238.182.113"

HOSTS="${HOST1} ${HOST2} ${HOST3} ${HOST4} ${HOST5}"
COMMAND="git status"
echo "Check branch status..."
echo "COMMAND: ${COMMAND}"
i=1
for host in ${HOSTS[@]}; do
  echo ""
  echo "HOST${i}: ${host}"
  ssh "isucon@${host}" "${COMMAND}"
  i=$((i+1))
done
