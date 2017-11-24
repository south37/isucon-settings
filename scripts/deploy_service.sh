#!/bin/bash

. "$(pwd)/scripts/var.txt"

echo "${SUDOPASS}" | sudo -S cp "$HOME/isu.ruby.service" "/etc/systemd/system/isu.ruby.service"
echo "${SUDOPASS}" | sudo -S cp "$HOME/isu.react.service" "/etc/systemd/system/isu.react.service"
echo "${SUDOPASS}" | sudo -S systemctl daemon-reload
