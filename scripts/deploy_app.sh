#!/bin/bash

if [ "$1" = "--bundle" ]; then
  echo 'Start bundle install...'
  cd "$HOME/webapp/ruby"
  bundle install
  cd "$HOME"
  echo 'bundle install finished!'
fi

echo 'Restart isu.ruby...'
echo "isucon" | sudo -S systemctl restart isu.ruby.service
echo 'Restarted isu.ruby!'
