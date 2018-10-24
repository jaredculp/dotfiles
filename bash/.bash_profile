PS1='\W \[\e[0;32m\]➜\[\e[m\] '

export PATH="~/bin:/usr/local/bin:$PATH"
export HISTCONTROL=ignoredups
export HISTSIZE=100000
export EDITOR="vim"
export CLICOLOR=1

bind Space:magic-space

shopt -s globstar
shopt -s nocaseglob
shopt -s histappend

bind "set completion-ignore-case on"
bind "set completion-map-case on"
bind "set show-all-if-ambiguous on"

. /usr/local/etc/bash_completion
