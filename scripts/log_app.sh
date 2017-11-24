#!/bin/bash

. "$(pwd)/scripts/var.txt"

echo "Log ruby..."
echo "${SUDOPASS}" | sudo -S journalctl -u isu.ruby.service
