#!/usr/bin/env bash
# Thank you: https://github.com/chrishunt/dot-files

set -e

function ok() {
  echo "$(tput setaf 2) $@ $(tput sgr0)"
}

function warn() {
  echo "$(tput setaf 3) $@ $(tput sgr0)"
}

ok "Here we go!"

ok "Pulling latest dot-files..."
cd $HOME/.dotfiles && git pull &> /dev/null

ok "Installing dotfiles..."
stow fish
stow git
stow tmux
stow vim

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

ok "Installing fisherman..."
if [ ! -f "$HOME/.config/fish/functions/fisher.fish" ]; then
  curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
else
  warn "(Skipping) Already fishing with fisherman."
fi
fish
fisher

ok "Done with setup!"
