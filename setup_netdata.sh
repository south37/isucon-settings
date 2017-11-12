#!/bin/bash

# Install netdata
bash <(curl -Ss https://my-netdata.io/kickstart.sh) all
sudo cp ./netdata/netdata.conf /etc/netdata/netdata.conf
sudo cp ./netdata/apps_groups.conf /etc/netdata/apps_groups.conf
sudo systemctl restart netdata
