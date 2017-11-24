#!/bin/bash

. "$(pwd)/scripts/var.txt"

echo "Log nginx..."
echo "${SUDOPASS}" | sudo -S journalctl -u nginx.service
