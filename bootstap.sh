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

function brew_it() {
  ok "Installing $1..."
  brew install $1
}

function tap_it() {
  ok "Tapping $1..."
  brew tap $1
}

function cask_it() {
  ok "Installing cask $1..."
  brew cask install $1
}

ok "Here we go!"

ok "Setting up colors..."
if [ ! -d "$HOME/.base16-shell" ]; then
  git clone https://github.com/chriskempson/base16-shell ~/.base16-shell
fi

ok "Installing homebrew..."
if command -v brew >/dev/null 2>&1; then
  warn "(Skipping) Already installed."
else
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

ok "Pulling latest dot-files..."
cd $HOME/.dotfiles && git pull &> /dev/null

ok "Installing brews..."
brew_it "stow"
brew_it "fish"
brew_it "tmux"
brew_it "reattach-to-user-namespace"
brew_it "vim --override-system-vi"
brew_it "coreutils"
brew_it "moreutils"
brew_it "the_silver_searcher"
brew_it "git"
brew_it "rbenv"
brew_it "mpd"
brew_it "ncmpcpp"

ok "Installing taps..."
tap_it "homebrew/services"
tap_it "caskroom/cask"

ok "Installing casks..."
cask_it "1password"
cask_it "alfred"
cask_it "dropbox"
cask_it "eclipse-java"
cask_it "flux"
cask_it "google-chrome"
cask_it "java"
cask_it "java7"
cask_it "macvim"
cask_it "sequel-pro"
cask_it "slack"
cask_it "sourcetree"
cask_it "spectacle"

ok "Installing dotfiles..."
stow_it "fish"
stow_it "git"
stow_it "tmux"
stow_it "vim"
stow_it "mpd"
stow_it "ncmpcpp"

ok "Setting up mpd..."
if [ ! -d "$HOME/.mpd" ]; then
  mkdir -p ~/.mpd/playlists
  touch ~/.mpd/{mpd.conf,mpd.db,mpd.log,mpd.pid,mpdstate}
fi

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
