#!/bin/bash

. "$(pwd)/scripts/var.txt"

echo "Log go app..."
echo "${SUDOPASS}" | sudo -S journalctl -u "${ISUSERVICE}"
