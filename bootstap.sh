#!/bin/bash

set -e

function stow_it() {
  echo "Stowing $1..."
  stow --adopt -t ~ "$1"
}

echo "Here we go!"

echo "Installing homebrew..."
if command -v brew >/dev/null 2>&1; then
  echo "(Skipping) Already installed."
else
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Setting up homebrew..."
brew tap 'homebrew/bundle'
brew bundle

echo "Pulling latest dot-files..."
cd $HOME/.dotfiles && git pull &> /dev/null

echo "Installing dotfiles..."
stow_it "git"
stow_it "tmux"
stow_it "vim"
stow_it "zsh"

echo "Setting up vim plugged..."
curl --silent -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim &> /dev/null
echo "Installing plugs..."
vim +PlugInstall +qall

echo "Setting up zsh..."
if [ $SHELL == '/usr/local/bin/zsh' ]; then
  echo "(Skipping) Already using zsh."
else
  sudo -v
  echo "/usr/local/bin/zsh" | sudo tee -a /etc/shells
  chsh -s /usr/local/bin/zsh
fi

echo "Done with setup!"
