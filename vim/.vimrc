" plugins
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'
Plug 'rking/ag.vim'
Plug 'kien/ctrlp.vim'
Plug 'itchyny/lightline.vim'
call plug#end()

" leader
let mapleader=" "                   " use space as leader
map ; :
nnoremap <leader>p :CtrlP<CR>

" colors!
set background=dark

" fonts
set guifont=Monaco:h14

" splits
nnoremap <Leader>j <C-W><C-J>
nnoremap <Leader>k <C-W><C-K>
nnoremap <Leader>l <C-W><C-L>
nnoremap <Leader>h <C-W><C-H>

" configuration
filetype plugin indent on           " load plugins according to filetype
syntax on                           " enable syntax highlighting

set expandtab                       " tabs are evil
set tabstop=2                       " read tab characters as two spaces
set softtabstop=2                   " a tab is two space
set shiftwidth=2                    " >> indents by 2 spaces
set shiftround                      " >> indents to next multiple of shiftwidth
set autoindent                      " indent according to previous line

set nowrap                          " don't wrap lines
set number                          " always show line numbers
set showmatch                       " set show matching parenthesis
set cursorline                      " highlight current line

set ignorecase                      " ignore case when searching
set smartcase                       " ignore case if search pattern is all lowercase
set hlsearch                        " highlight search terms
set incsearch                       " show search matches as you type
set regexpengine=1                  " use old regexp engine
set clipboard=unnamed               " use the system clipboard

set ttyfast                         " faster redrawing
set lazyredraw                      " only redraw when necessary
set wildignore+=*/target/*
