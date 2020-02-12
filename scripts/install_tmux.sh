#!/bin/sh

TMUX_CONF=${HOME}/.tmux.conf
if [ -L $TMUX_CONF ]; then
    unlink $TMUX_CONF
fi
ln -s ${MY_ENV_ROOT}/dotfiles/tmux/.tmux.conf ${HOME}/.tmux.conf

# Installs and loads tmux plugins.
# https://github.com/tmux-plugins/tpm

if [ ! -d ${HOME}/.tmux/plugins/tpm ]; then
  git clone https://github.com/tmux-plugins/tpm ${HOME}/.tmux/plugins/tpm
else
  cd ${HOME}/.tmux/plugins/tpm
  git pull
fi
