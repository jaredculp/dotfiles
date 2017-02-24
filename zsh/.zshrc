source /usr/local/opt/zplug/init.zsh

zplug 'mafredri/zsh-async'
zplug 'sindresorhus/pure'
zplug 'zsh-users/zsh-syntax-highlighting'
zplug 'zsh-users/zsh-completions'

if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  else
    echo
  fi
fi

zplug load

# ========== env ==========
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/bin:$PATH"

# ========== colors ==========
autoload -U colors
export CLICOLOR=1

# ========== general ==========
setopt autocd
export EDITOR="vim"

sz() { source $HOME/.zshrc }

# ========== history ==========
if [ -z "$HISTFILE" ]; then
  HISTFILE=$HOME/.zsh_history
fi

HISTSIZE=10000
SAVEHIST=10000

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history
