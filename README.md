# dotfiles 🏠

These are my dotfiles, because there's no place like `$HOME`.

I use:
* [stow](https://gnu.org/software/stow) to bootstrap
* [vim](https://vim.org) as my $EDITOR
* [tmux](https://tmux.github.io) as my terminal multiplexer
* [bash](https://gnu.org/software/bash) as my $TERM
* [homebrew](https://brew.sh) to install shit

Clone the repository:
```
git clone http://github.com/jaredculp/dotfiles.git ~/.dotfiles
```

Run tests:
```
./test.sh
```

And then install:
```
stow $dir
```
