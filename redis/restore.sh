#!/bin/bash

# dir in redis.conf. `sudo systemctl restart redis` may be necessary
# -rw-r--r--  1 redis redis   26 Oct 21 11:09 dump.rdb
if [ $# -ne 1 ]; then
  echo "please specify redis dump file"
  echo "example: ./redis_restore redis/20171021114654_redis_dump.rdb"
  exit 1
fi

# echo password | sudo -S systemctl stop redis
# echo password | sudo -S cp $1 /var/lib/redis/dump.rdb
# echo password | sudo -S systemctl start redis
sudo systemctl stop redis
sudo cp $1 /var/lib/redis/dump.rdb
sudo systemctl start redis
