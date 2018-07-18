" filetype support
filetype plugin indent on
syntax on

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'romainl/apprentice'
Plug 'junegunn/fzf'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
call plug#end()

" basic settings
set backspace=indent,eol,start
set clipboard^=unnamed
set expandtab
set hidden
set incsearch
set laststatus=2
set path=.,**
set shiftround
set shiftwidth=2
set softtabstop=2
set tabstop=2
set wildmenu

" mappings
nnoremap ,f :FZF<cr>
nnoremap ,b :ls<cr>:b<space>

" colors
colorscheme apprentice

" see :h 'statusline'
" left:  filename modified-flag
" right: git-branch filetype line column position
set statusline=\ %f\ %m\ %=%{fugitive#head()}\ %y\ %04.l:%03.c\ %P\ 
