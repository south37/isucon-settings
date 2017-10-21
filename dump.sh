#!/bin/bash

# -rw-r--r--  1 redis redis   26 Oct 21 11:09 dump.rdb
sudo cp /var/lib/redis/dump.rdb "$HOME/data/`date +"%Y%m%d%H%M%S"`_redis_dump.rdb"
