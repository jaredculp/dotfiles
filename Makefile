all:
	[ -f ~/.gitconfig ] || ln -s $(PWD)/git/.gitconfig ~/.gitconfig
	[ -f ~/.tmux.conf ] || ln -s $(PWD)/tmux/.tmux.conf ~/.tmux.conf
	[ -f ~/.vimrc ] || ln -s $(PWD)/vim/.vimrc ~/.vimrc
	[ -f ~/.zshrc ] || ln -s $(PWD)/zsh/.zshrc ~/.zshrc

.PHONY: all
