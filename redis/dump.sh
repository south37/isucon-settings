#!/bin/bash

# dir in redis.conf. `sudo systemctl restart redis` may be necessary
# -rw-r--r--  1 redis redis   26 Oct 21 11:09 dump.rdb
# echo password | sudo -S cp /var/lib/redis/dump.rdb "$HOME/data/`date +"%Y%m%d%H%M%S"`_redis_dump.rdb"
sudo cp /var/lib/redis/dump.rdb "$HOME/redis/`date +"%Y%m%d%H%M%S"`_redis_dump.rdb"
