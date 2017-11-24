#!/bin/bash

. "$(pwd)/all_scripts/hosts.txt"

BRANCH_COMMAND="git branch | grep '*' | awk '{ print \$2 }'"
COMMAND="hostname && git pull origin \$(${BRANCH_COMMAND}) && \$(pwd)/scripts/rotate_and_cp.sh && git add . && git commit -m 'Add log' && git push origin \$(${BRANCH_COMMAND})"

echo "${COMMAND}"
for i in ${NGINX_HOSTS[@]}; do
  echo ""
  echo $i
  ssh "${ISUCONUSER}@${i}" "${COMMAND}"
done

git pull origin `git branch | grep '\*' | awk '{ print \$2 }'`
