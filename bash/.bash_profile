for file in ~/.{bash_prompt,bash_local}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done
unset file;

# enable features
for option in {nocaseglob,histappend,cdspell,autocd,globstar,checkwinsize}; do
  shopt -s "$option"
done
unset option;

export PATH="$HOME/bin:$HOME/go/bin:/usr/local/bin:$PATH"
export EDITOR="vim"
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

[ -f "/usr/local/etc/bash_completion" ] && source "/usr/local/etc/bash_completion"
unset brew_home;

eval "$(direnv hook bash)"
