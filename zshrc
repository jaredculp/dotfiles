# vi mode
bindkey -v
bindkey '^R' history-incremental-search-backward

# set up path
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/mysql/bin:$PATH"
export PATH="$PATH:$HOME/.rvm/bin"

export TERM="xterm-256color"
export EDITOR=vim
export VISUAL=vim
export JAVA_HOME=`/usr/libexec/java_home -v 1.7`

source $HOME/.aliases
source $HOME/.functions

if [[ "$HOST" != "dreamingtree" ]]; then
    source $HOME/.opower_settings
fi

ZSH_THEME="kolo"
plugins=(git colorize themes)

source $HOME/.oh-my-zsh/oh-my-zsh.sh

# zsh options
setopt autolist
setopt cdablevars
setopt autonamedirs
setopt histignorEdups
setopt listtypes
setopt nolistbeep
