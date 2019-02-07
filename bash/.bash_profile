#!/usr/bin/env bash
# shellcheck source=/dev/null

export PATH="$HOME/bin:/usr/local/bin:$PATH"
export EDITOR="vim"
export CLICOLOR=1

shopt -s histappend
export HISTCONTROL=ignoredups:erasedups
export HISTSIZE=100000
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

shopt -s globstar
shopt -s nocaseglob

bind "set completion-ignore-case on"
bind "set completion-map-case on"
bind "set show-all-if-ambiguous on"

. /usr/local/etc/bash_completion

GREEN="\\[$(tput setaf 2)\\]"
RESET="\\[$(tput sgr0)\\]"

export GIT_PS1_SHOWDIRTYSTATE="true"
export GIT_PS1_SHOWUNTRACKEDFILES="true"
export GIT_PS1_SHOWCOLORHINTS="true"
export GIT_PS1_SHOWUPSTREAM="auto"
export PROMPT_COMMAND='__git_ps1 "\W" " ${GREEN}\$${RESET} "'

. "$HOME/.bash_local"
