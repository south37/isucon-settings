#!/bin/bash

. "$(pwd)/scripts/var.txt"

if [ "$1" = "--bundle" ]; then
  echo 'Start bundle install...'
  cd "$HOME/webapp/ruby"
  bundle install
  cd "$HOME"
  echo 'bundle install finished!'
fi

echo "Restart ${ISUSERVICE}..."
echo "${SUDOPASS}" | sudo -S systemctl restart "${ISUSERVICE}"
echo "Restarted ${ISUSERVICE}!"
