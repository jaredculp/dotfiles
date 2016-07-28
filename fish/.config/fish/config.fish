#!/usr/local/bin/fish
set -gx PATH /usr/local/bin /usr/local/sbin $PATH

set fish_greeting ""

if test $USER = "jared.culp"
  source ~/.opower_settings
end

if status --is-interactive
  eval sh $HOME/.base16-shell/scripts/base16-ocean.sh
end
