#!/usr/bin/env bash
#
# Installs dotfiles.

echo "Installing homebrew"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Updating homebrew"
brew update
brew upgrade

echo "Installing programs"
brew install bash
brew install bash-completion
brew install cmus
brew install fzf
brew install git
brew install htop
brew install jq
brew install neofetch
brew install stow
brew install the_silver_searcher
brew install tmux
brew install vim --with-override-system-vi

echo "Installing casks"
brew tap homebrew/cask-versions
brew cask install 1password6
brew cask install alfred
brew cask install docker
brew cask install flux
brew cask install iterm2
brew cask install slack
brew cask install spectacle
brew cask install spotify
brew cask install vanilla
brew cask install vlc
brew cask install zoomus

echo "Setting up bash"
echo "/usr/local/bin/bash" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/bash

echo "Stowing dotfiles"
stow bash
stow git
stow tmux
stow vim
