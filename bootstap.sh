#!/usr/bin/env bash

set -e

function ok() {
  echo "$(tput setaf 2) $@ $(tput sgr0)"
}

function warn() {
  echo "$(tput setaf 3) $@ $(tput sgr0)"
}

function stow_it() {
  ok "Stowing $1..."
  stow --adopt -t ~ "$1"
}

ok "Here we go!"

ok "Pulling latest dot-files..."
cd $HOME/.dotfiles && git pull &> /dev/null

ok "Installing dotfiles..."
stow_it "fish"
stow_it "git"
stow_it "tmux"
stow_it "vim"

ok "Installing homebrew..."
if command -v brew >/dev/null 2>&1; then
  warn "(Skipping) Already installed."
else
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" &> /dev/null
fi

# ok "Updating homebrew..."
# brew update &> /dev/null

ok "Setting up vim plugged..."
curl --silent -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim &> /dev/null
ok "Installing plugs..."
vim +PlugInstall +qall

ok "Setting up fish shell..."
if [ $SHELL == '/usr/local/bin/fish' ]; then
  warn "(Skipping) Already using fish."
else
  sudo -v
  echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
  chsh -s /usr/local/bin/fish
fi

ok "Installing fin..."
if [ ! -f "$HOME/.config/fish/functions/fin.fish" ]; then
  curl --silent -Lo ~/.config/fish/functions/fin.fish --create-dirs git.io/fin
else
  warn "(Skipping) Already fishing with fin."
fi
fish -c fin

ok "Done with setup!"
