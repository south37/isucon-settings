#!/bin/bash

echo "isucon" | sudo -S cp "$HOME/isu.ruby.service" "/etc/systemd/system/isu.ruby.service"
echo "isucon" | sudo -S cp "$HOME/isu.react.service" "/etc/systemd/system/isu.react.service"
echo "isucon" | sudo -S systemctl daemon-reload
