#!/bin/bash

# enable features
for option in {nocaseglob,histappend,cdspell,autocd,globstar,checkwinsize}; do
  shopt -s "$option"
done
unset option;

# bash completion
if [[ -f /usr/local/etc/bash_completion ]]; then
  # shellcheck source=/dev/null
  source "/usr/local/etc/bash_completion"
  # shellcheck source=/dev/null
  source "/usr/local/etc/bash_completion.d/git-prompt.sh"
fi

for file in ~/.{bash_prompt,bash_local,exports,functions}; do
  if [[ -r "$file" ]] && [[ -f "$file" ]]; then
    # shellcheck source=/dev/null
    source "$file";
  fi
done
unset file;

eval "$(direnv hook bash)"
