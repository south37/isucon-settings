#!/bin/bash

sudo cp /var/lib/redis/dump.rdb "$HOME/data/`date +"%Y%m%d%H%M%S"`_redis_dump.rdb"
