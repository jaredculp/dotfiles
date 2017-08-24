export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"
ZSH_THEME_PROMPT_SYMBOL="───"

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

# colors
source $HOME/.config/base16/templates/shell/base16-shell.plugin.zsh

# not checked in

[[ -f "$HOME/.zshrc.local" ]] && source "$HOME/.zshrc.local"
