#!/bin/bash

echo "Log ruby..."
echo "${SUDOPASS}" | sudo -S journalctl -u isu.ruby.service
