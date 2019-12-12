export PS1="%~ %% "
export PATH=$PATH:$HOME/bin
export CLICOLOR=1
export EDITOR=nvim
export SHELL=/usr/local/bin/zsh
export TERM=xterm-256color

export HISTSIZE=1000
export SAVEHIST=1000
export HISTFILE=~/.history
export HISTCONTROL=ignoredups:erasedups
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
export JAVA_HOME=$(/usr/libexec/java_home -v '1.8')

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{A-Za-z}={a-zA-z}' '+l:|=* r:|=*'

autoload -Uz vcs_info
zstyle ':vcs_info:git*' formats "[%b] "
precmd() {
  vcs_info
  PS1="%~ %F{green}${vcs_info_msg_0_}%f$ "
}

bindkey -e

alias vim='nvim'
