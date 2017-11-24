#!/bin/bash

. "$(pwd)/all_scripts/hosts.txt"

if [ "$#" -ne 1 ]; then
  echo "You must specify branch!"
  exit 1
fi

COMMAND="git checkout $1"
echo "Checkout branch..."
echo "COMMAND: ${COMMAND}"
i=1
for host in ${HOSTS[@]}; do
  echo ""
  echo "HOST${i}: ${host}"
  ssh "${ISUCONUSER}@${host}" "${COMMAND}"
  i=$((i+1))
done
