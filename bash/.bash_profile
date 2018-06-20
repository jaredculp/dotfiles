#!/bin/bash

# enable features
for option in {nocaseglob,histappend,cdspell,autocd,globstar,checkwinsize}; do
  shopt -s "$option"
done
unset option;

# prompt
# shellcheck source=/dev/null
source "/usr/local/etc/bash_completion.d/git-prompt.sh"

GREEN="\\[$(tput setaf 2)\\]"
RESET="\\[$(tput sgr0)\\]"

export GIT_PS1_SHOWDIRTYSTATE="true"
export GIT_PS1_SHOWUNTRACKEDFILES="true"
export GIT_PS1_SHOWCOLORHINTS="true"
export GIT_PS1_SHOWUPSTREAM="auto"
export PROMPT_COMMAND='__git_ps1 "\W" " ${GREEN}\$${RESET} "'
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# exports 
export GOPATH="$HOME/go"
export PATH="$HOME/bin:$GOPATH/bin:/usr/local/bin:$PATH"
export EDITOR="vim"

export HISTFILE="$HOME/.bash_history"
export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTCONTROL=ignoredups:erasedups

# machine specific
[[ -f "$HOME/.bash_local" ]] && source "$HOME/.bash_local"
