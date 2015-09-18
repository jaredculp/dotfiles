call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible' 
Plug 'tpope/vim-surround'
Plug 'bling/vim-airline'
Plug 'chriskempson/base16-vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'kien/ctrlp.vim'
call plug#end()

" leader
let mapleader=" "                   " use space as leader
map ; :
map <Leader>w :w<CR>                " write
map <Leader>q :wq<CR>               " write and quit
map <Leader>nt :NERDTreeToggle<CR>  " open a file brower buffer
map <Leader>p :CtrlP                " open a fuzzyfinder buffer
map <Leader>v :vsplit<CR>           " do a vertical split
map <Leader>h :split<CR>            " do a horizontal split
map <Leader>h <C-w>h                " move to left split
map <Leader>j <C-w>j                " move to bottom split
map <Leader>k <C-w>k                " move to top split
map <Leader>l><C-w>l                " move to right split

" colors!
syntax on                           " always use syntax highlighting
colorscheme base16-solarized
set background=dark

" don't bother with powerline glyphs
let g:airline_left_sep=''
let g:airline_right_sep=''

" set some defaults
set nowrap                          " don't wrap lines
set expandtab                       " tabs are evil
set tabstop=4                       " a tab is four spaces
set shiftwidth=4                    " number of spaces to use for autoindenting
set smarttab                        " insert tabs on the start of a line according to
                                    "    shiftwidth, not tabstop
set shiftround                      " use multiple of shiftwidth when indenting with '<' and '>'
set autoindent                      " always set autoindenting on
set copyindent                      " copy the previous indentation on autoindenting
set number                          " always show line numbers
set showmatch                       " set show matching parenthesis
set cursorline                      " highlight current line
set ignorecase                      " ignore case when searching
set smartcase                       " ignore case if search pattern is all lowercase,
                                    "    case-sensitive otherwise
set hlsearch                        " highlight search terms
set incsearch                       " show search matches as you type
