#!/bin/bash

echo "Log nginx..."
echo "isucon" | sudo -S journalctl -u nginx.service
