#!/bin/bash

# For dev
cp ./.emacs.el "$HOME/.emacs.el"
cp ./.gitconfig "$HOME/.gitconfig"
cp ./.gitignore "$HOME/.gitignore"
cp ./tmpl/authorized_keys "$HOME/.ssh/authorized_keys"
chmod 600 "$HOME/.ssh/authorized_keys"

# For dev
cp ./tmpl/README.md "$HOME/README.md"
cp ./kataribe.toml "$HOME/kataribe.toml"

# Shell Script
for f in $(find `pwd` -name '*.sh'); do
  cp $f "$HOME/$(basename $f)"
done

mkdir "$HOME/redis"
cp ./redis/dump.sh "$HOME/redis/dump.sh"
cp ./redis/restore.sh "$HOME/redis/restore.sh"

mkdir "$HOME/log"  # Used in rotate_and_cp.sh

# For ansible
cp -r ./ansible "$HOME/ansible"

# Install netdata
bash <(curl -Ss https://my-netdata.io/kickstart.sh) all
sudo cp ./netdata/netdata.conf /etc/netdata/netdata.conf
sudo cp ./netdata/apps_groups.conf /etc/netdata/apps_groups.conf
sudo systemctl restart netdata
