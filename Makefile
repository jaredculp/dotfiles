THIS_DIR := $(shell pwd)
EXCLUDED_DOTFILES := .git README.md colorbars zenbar
DOTFILES := $(addprefix ~/, $(filter-out $(EXCLUDED_DOTFILES), $(wildcard .*)))

.DEFAULT_GOAL = all
.PHONY = dotfiles macos brew cask bash tmux myvim wm

all: dotfiles macos brew cask bash myvim

dotfiles: $(DOTFILES)

~/.%:
	cd ~ && ln -sfv $(THIS_DIR)/$(notdir $@) $@

macos:
	$(shell ./.macos)

brew: /usr/local/bin/brew
	brew update
	brew upgrade
	brew tap homebrew/cask-versions
	brew install fzf
	brew install git
	brew install jq
	brew install the_silver_searcher
	brew install tmux
	brew install cmus
	brew install htop
	brew install neofetch

/usr/local/bin/brew:
	ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

wm:
	brew install koekeishiya/formulae/skhd || true
	brew tap crisidev/homebrew-chunkwm
	brew install chunkwm
	brew cask install ubersicht
	ln -sfv $(THIS_DIR)/zenbar "$(HOME)/Library/Application Support/Übersicht/widgets"
	chown $(whoami):$(whoami) ~/.chunkwmrc ~/.skhdrc

cask:
	brew cask install 1password6
	brew cask install alfred
	brew cask install docker
	brew cask install flux
	brew cask install google-chrome-beta
	brew cask install iterm2
	brew cask install slack
	brew cask install spectacle
	brew cask install spotify
	brew cask install vanilla
	brew cask install vlc
	brew cask install zoomus

bash:
	brew install bash
	brew install bash-completion
	echo "/usr/local/bin/bash" | sudo tee -a /etc/shells
	chsh -s /usr/local/bin/bash

myvim: ~/.vimrc
	brew install vim --with-override-system-vi
	vim +PlugInstall +qall

work:
	brew install ruby-install
	brew install chruby
	brew install mysql
	brew install maven
