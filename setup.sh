#!/bin/bash

cp ./.emacs.el "$HOME/.emacs.el"
cp ./.gitconfig "$HOME/.gitconfig"
cp ./.gitignore "$HOME/.gitignore"
cp ./authorized_keys "$HOME/.ssh/authorized_keys"
chmod 600 "$HOME/.ssh/authorized_keys"

cp ./deploy.sh "$HOME/deploy.sh"
cp ./rotate.sh "$HOME/rotate.sh"
cp ./log.sh "$HOME/log.sh"
cp ./dump.sh "$HOME/dump.sh"
