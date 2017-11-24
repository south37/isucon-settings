#!/bin/bash

echo "Log ruby..."
echo "isucon" | sudo -S journalctl -u isu.ruby.service
