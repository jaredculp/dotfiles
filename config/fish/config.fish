#!/usr/local/bin/fish
set -gx PATH /usr/local/bin /usr/local/sbin $PATH ~/bin
status --is-interactive; and . (rbenv init -|psub)

eval sh $HOME/.config/base16-shell/base16-ocean.dark.sh

source ~/.opower_settings
