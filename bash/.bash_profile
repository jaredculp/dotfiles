#!/bin/bash

for file in ~/.{bash_prompt,bash_local}; do
  if [[ -r "$file" ]] && [[ -f "$file" ]]; then
    # shellcheck source=/dev/null
    source "$file";
  fi
done
unset file;

# enable features
for option in {nocaseglob,histappend,cdspell,autocd,globstar,checkwinsize}; do
  shopt -s "$option"
done
unset option;

export PATH="$HOME/bin:$HOME/go/bin:/usr/local/bin:$PATH"
export EDITOR="vim"
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

if [[ -f /usr/local/etc/bash_completion ]]; then
  # shellcheck source=/dev/null
  source "/usr/local/etc/bash_completion"
fi

eval "$(direnv hook bash)"
