# dotfiles

These are my dotfiles, because there's no place like `$HOME`.

I use:
* [rcm](https://github.com/thoughtbot/rcm) to manage symlinks
* Vim as my $EDITOR
* Zsh as my $TERM
* [base-16](https://github.com/chriskempson/base16) as my colorscheme

Clone the repository:
```
git clone http://github.com/jaredculp/dotfiles.git ~/.dotfiles
```

Install vim-plug
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Install RCM
```
brew tap thoughtbot/formulae
brew install rcm
```

Install the dotfiles:
```
rcup -v
```
