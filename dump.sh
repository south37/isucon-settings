#!/bin/bash

sudo cp /var/lib/redis/dump.rdb "./data/`date +"%Y%m%d%H%M%S"`_access.log"
