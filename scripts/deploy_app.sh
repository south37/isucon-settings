#!/bin/bash

. "$(pwd)/scripts/var.txt"

# NOTE: Comment out because we use go and dep!
# if [ "$1" = "--bundle" ]; then
#   echo 'Start bundle install...'
#   cd "$HOME/webapp/ruby"
#   bundle install
#   cd "$HOME"
#   echo 'bundle install finished!'
# fi

echo "Building ${ISUSERVICE}..."
cd "$HOME/isubata/webapp/go"
make
echo "Finished building ${ISUSERVICE}..."

echo "Restart ${ISUSERVICE}..."
echo "${SUDOPASS}" | sudo -S systemctl restart "${ISUSERVICE}"
echo "Restarted ${ISUSERVICE}!"
