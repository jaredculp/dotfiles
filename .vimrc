" filetype support
filetype plugin indent on
syntax on

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'junegunn/fzf'
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'morhetz/gruvbox'
call plug#end()

" basic settings
set backspace=indent,eol,start
set clipboard^=unnamed
set expandtab
set hidden
set incsearch
set hlsearch
set laststatus=2
set path=.,**
set shiftround
set shiftwidth=2
set softtabstop=2
set tabstop=2
set wildmenu

set nobackup
set noswapfile

" mappings
nnoremap ,f :FZF<cr>
nnoremap ,b :ls<cr>:b<space>

" see :h 'statusline'
" left:  filename modified-flag
" right: git-branch filetype line column position
set statusline=%f\ %{fugitive#head()}\%m%=\%y\ %04.l:%03.c\ %P

colo gruvbox
