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
mkdir "$HOME/scripts"
for f in $(find `pwd`/scripts -maxdepth 1 -name '*.sh'); do
  cp $f "$HOME/scripts/$(basename $f)"
done

mkdir "$HOME/redis"
cp ./redis/dump.sh "$HOME/redis/dump.sh"
cp ./redis/restore.sh "$HOME/redis/restore.sh"

mkdir "$HOME/log"  # Used in rotate_and_cp.sh

# For ansible
cp -r ./ansible "$HOME/ansible"

./setup_netdata.sh
