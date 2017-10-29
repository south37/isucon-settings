#!/bin/bash

# For dev
cp ./.emacs.el "$HOME/.emacs.el"
cp ./.gitconfig "$HOME/.gitconfig"
cp ./.gitignore "$HOME/.gitignore"
cp ./authorized_keys "$HOME/.ssh/authorized_keys"
chmod 600 "$HOME/.ssh/authorized_keys"

# For dev
cp ./tmpl/README.md "$HOME/README.md"
cp ./kataribe.toml "$HOME/kataribe.toml"

# Shell Script
cp ./deploy.sh "$HOME/deploy.sh"
cp ./rotate.sh "$HOME/rotate.sh"
cp ./rotate_and_cp.sh "$HOME/rotate_and_cp.sh"
cp ./ruby_log.sh "$HOME/ruby_log.sh"
cp ./nginx_log.sh "$HOME/nginx_log.sh"
cp ./redis_dump.sh "$HOME/redis_dump.sh"
cp ./redis_restore.sh "$HOME/redis_restore.sh"

mkdir "$HOME/log"  # Used in rotate_and_cp.sh
mkdir "$HOME/data" # Used in redis_dump.sh and redis_restore.sh

# Install netdata
bash <(curl -Ss https://my-netdata.io/kickstart.sh) all
sudo cp ./netdata/netdata.conf /etc/netdata/netdata.conf
sudo cp ./netdata/apps_groups.conf /etc/netdata/apps_groups.conf
sudo systemctl restart netdata
