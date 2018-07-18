#!/bin/bash

# enable features
for option in {nocaseglob,histappend,cdspell,autocd,globstar,checkwinsize}; do
  shopt -s "$option"
done
unset option;

for f in {.bash_prompt,.exports}; do
  source "$f"
done

# ruby
source /usr/local/opt/chruby/share/chruby/chruby.sh

# machine specific
[[ -f "$HOME/.bash_local" ]] && source "$HOME/.bash_local"

#[[ -z "$TMUX" ]] && { tmux attach || exec tmux new-session; }
