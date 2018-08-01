#!/usr/bin/env bash

# enable features
for option in {nocaseglob,histappend,cdspell,autocd,globstar,checkwinsize,cdable_vars}; do
  shopt -s "$option"
done
unset option;

for f in {.bash_prompt,.aliases,.exports}; do
  source "$f"
done

# machine specific
[[ -f "$HOME/.bash_local" ]] && source "$HOME/.bash_local"
