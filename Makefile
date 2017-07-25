all: brew shell
	[ -f ~/.gitconfig ] || ln -s $(PWD)/git/.gitconfig ~/.gitconfig
	[ -f ~/.tmux.conf ] || ln -s $(PWD)/tmux/.tmux.conf ~/.tmux.conf
	[ -f ~/.vimrc ] || ln -s $(PWD)/vim/.vimrc ~/.vimrc

brew:
	@which brew > /dev/null || @ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew bundle

shell:
	[ -n "$ZSH_VERSION" ] || chsh -s /usr/local/bin/zsh
	[ -d ~/.oh-my-zsh ] || @curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh
	[ -f ~/.zshrc ] || ln -s $(PWD)/zsh/.zshrc ~/.zshrc

.PHONY: all brew shell
