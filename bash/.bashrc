if [ -f ~/.bash_sensible ]; then
  source ~/.bash_sensible
fi

export PATH="/usr/local/bin:$PATH"

if [ -f ~/.base16-shell/scripts/base16-ocean.sh ]; then
  source ~/.base16-shell/scripts/base16-ocean.sh
fi

source /usr/local/opt/git/etc/bash_completion.d/git-completion.bash
source /usr/local/opt/git/etc/bash_completion.d/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\w$(__git_ps1) '
