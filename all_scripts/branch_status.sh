#!/bin/bash

. "$(pwd)/all_scripts/hosts.txt"

COMMAND="git status"
echo "Check branch status..."
echo "COMMAND: ${COMMAND}"
i=1
for host in ${HOSTS[@]}; do
  echo ""
  echo "HOST${i}: ${host}"
  ssh "${ISUCONUSER}@${host}" "${COMMAND}"
  i=$((i+1))
done
