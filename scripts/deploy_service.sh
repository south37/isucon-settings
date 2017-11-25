#!/bin/bash

. "$(pwd)/scripts/var.txt"

echo "${SUDOPASS}" | sudo -S cp "$HOME/${ISUSERVICE}.service" "/etc/systemd/system/${ISUSERVICE}.service"
echo "${SUDOPASS}" | sudo -S systemctl daemon-reload
