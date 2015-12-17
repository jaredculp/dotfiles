# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# vi-mode
bindkey -v
bindkey '^R' history-incremental-search-backward

export EDITOR=`which vim`
export VISUAL=`which vim`

# set up path
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/mysql/bin:$PATH"

export TERM="xterm-256color"
export JAVA_HOME=`/usr/libexec/java_home -v 1.7`

source $HOME/.aliases
source $HOME/.functions

if [[ "$HOST" != "dreamingtree" ]]; then
    source $HOME/.opower_settings
fi
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
