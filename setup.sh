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
cp -rf `pwd`/scripts "$HOME"

# Shell Script for all hosts
cp -rf `pwd`/all_scripts "$HOME"

# For lua
cp -rf `pwd`/lua "$HOME"

mkdir "$HOME/redis"
cp ./redis/dump.sh "$HOME/redis/dump.sh"
cp ./redis/restore.sh "$HOME/redis/restore.sh"

mkdir "$HOME/log"  # Used in rotate_and_cp.sh

# For ansible
cp -r ./ansible "$HOME/ansible"

./setup_netdata.sh
