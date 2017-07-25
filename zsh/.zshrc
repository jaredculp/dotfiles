export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# env
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export EDITOR="vim"

# aliases

alias v="vim"
alias be="bundle exec"
alias d="docker"
alias g="git"
alias t="tmux"

# functions
sz() { source $HOME/.zshrc }

# not checked in

[[ -f "$HOME/.zshrc.local" ]] && source "$HOME/.zshrc.local"
