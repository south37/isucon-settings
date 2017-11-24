#!/bin/bash

echo "Log nginx..."
echo "${SUDOPASS}" | sudo -S journalctl -u nginx.service
