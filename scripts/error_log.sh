#!/bin/bash

. "$(pwd)/scripts/var.txt"

echo "Error Log of nginx..."
echo "${SUDOPASS}" | sudo -S cat /var/log/nginx/error.log
