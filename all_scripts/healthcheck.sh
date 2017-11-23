#!/bin/bash

. "$(pwd)/all_scripts/hosts.txt"

echo "Start Healthcheck..."
for i in ${WEB_HOSTS[@]}; do
  echo ""
  echo $i

  echo "http://${i}:8080/api/rooms"
  curl "http://${i}:8080/api/rooms" -LI -o /dev/null -w '%{http_code}\n' -s

  echo "http://${i}:3000/"
  curl "http://${i}:3000/"  -LI -o /dev/null -w '%{http_code}\n' -s
done
echo "Complete Healthcheck!"
