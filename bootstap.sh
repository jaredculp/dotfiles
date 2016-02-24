#!/usr/bin/env bash
# Thank you: https://github.com/chrishunt/dot-files

set -e

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "==> Here we go..."

echo "  > Installing homebrew..."
if command -v brew >/dev/null 2>&1; then
  echo "    > (Skipping) Already installed."
else
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" &> /dev/null
fi

echo "  > Updating homebrew..."
brew update

echo "  > Pulling latest dot-files..."
cd $HOME/.dotfiles && git pull &> /dev/null

echo "  > Installing taps..."
brew tap $(cat Tapfile|grep -v "#") 2> /dev/null

echo "  > Installing brews..."
brew install $(cat Brewfile|grep -v "#") 2> /dev/null

echo "  > Installing casks..."
brew cask install $(cat Caskfile|grep -v "#") 2> /dev/null

echo "  > Setting up fish shell..."
if [ $SHELL == '/usr/local/bin/fish' ]; then
  echo "    > (Skipping) Already using fish."
else
  echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
  chsh -s /usr/local/bin/fish
fi

echo "  > Setting up vim plugged..."
curl --silent -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "    > Installing plugs..."
vim +PlugInstall +qall

echo "  > Installing dotfiles..."
rcup -v

echo "==> Done with setup."
