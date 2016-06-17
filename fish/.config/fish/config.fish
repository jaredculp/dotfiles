#!/usr/local/bin/fish
set -gx PATH /usr/local/bin /usr/local/sbin $PATH ~/bin

set fish_greeting ""

if test $USER = "jared.culp"
  source ~/.opower_settings
end
