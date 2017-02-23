" plugins
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-endwise'

Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'
Plug 'majutsushi/tagbar'
Plug 'rking/ag.vim'
Plug 'ctrlpvim/ctrlp.vim'

Plug 'ntpeters/vim-better-whitespace'
Plug 'raimondi/delimitmate'

Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'
Plug 'edkolev/tmuxline.vim'
call plug#end()

" leader
let mapleader=" "                   " use space as leader
map ; :
imap jk <Esc>
nnoremap <leader>p :CtrlP<CR>

" colors!
set background=dark
colorscheme gruvbox
let g:lightline = {'colorscheme': 'gruvbox'}

" fonts
set guifont=iosevka:h18
set guioptions-=r

" splits
nnoremap <Leader>j <C-W><C-J>
nnoremap <Leader>k <C-W><C-K>
nnoremap <Leader>l <C-W><C-L>
nnoremap <Leader>h <C-W><C-H>

" tags
set tags=./tags;,~/.tags
let g:easytag_async = 1
let g:easytag_dynamic_files = 2     " look for project-specific tags files
nmap <silent> <Leader>b :TagbarToggle<CR>

" omni completion
inoremap <silent> ,o <C-x><C-o>

" whitespace
autocmd BufEnter * EnableStripWhitespaceOnSave

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
