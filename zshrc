# vi mode
bindkey -v
bindkey '^R' history-incremental-search-backward

export PATH="/usr/local/bin:/usr/local/mysql/bin:$PATH"
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export TERM="xterm-256color"
export EDITOR=vim
export VISUAL=vim
export JAVA_HOME=`/usr/libexec/java_home -v 1.7`

source $HOME/.aliases

if [[ "$HOST" != "dreamingtree" ]]; then
    source $HOME/.opower_settings
fi

ZSH=$HOME/.oh-my-zsh

ZSH_THEME="kolo"
plugins=(git colorize themes)

source $ZSH/oh-my-zsh.sh

# zsh options
setopt autolist
setopt cdablevars
setopt autonamedirs
setopt histignorEdups
setopt listtypes
setopt nolistbeep
