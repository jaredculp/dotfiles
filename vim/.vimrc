if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'fatih/molokai'
Plug 'tpope/vim-vinegar'
call plug#end()

filetype plugin indent on
syntax on
set autoindent
set backspace=indent,eol,start
set hidden
set incsearch
set laststatus=2
set number
set path=.,**
set ruler
set shiftround
set wildmenu
set wildignore+=*.class
set wildignore+=target/*

set clipboard^=unnamed

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

colorscheme molokai

nnoremap ,f :find *
