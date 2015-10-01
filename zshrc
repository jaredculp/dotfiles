# vi mode
bindkey -v
bindkey '^R' history-incremental-search-backward

export PATH="/usr/local/bin:/usr/local/mysql/bin:$PATH"
export TERM="xterm-256color"
export EDITOR=vim
export VISUAL=vim

source $HOME/.aliases
source $HOME/.opower_settings

ZSH=$HOME/.oh-my-zsh

ZSH_THEME="pure"
plugins=(git colorize themes)

source $ZSH/oh-my-zsh.sh

# zsh options
setopt autolist
setopt cdablevars
setopt autonamedirs
setopt histignorEdups
setopt listtypes
setopt nolistbeep

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
