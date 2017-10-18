#!/bin/bash

cp ./.emacs.el "$HOME/.emacs.el"
cp ./.gitconfig "$HOME/.gitconfig"
cp ./authorized_keys "$HOME/authorized_keys"
chmod 600 "$HOME/authorized_keys"

cp ./deploy.sh "$HOME/deploy.sh"
cp ./rotate.sh "$HOME/rotate.sh"
cp ./log.sh "$HOME/log.sh"
