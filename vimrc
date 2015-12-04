call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-endwise'
Plug 'vim-ruby/vim-ruby'
Plug 'bling/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'kien/ctrlp.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'majutsushi/tagbar'
Plug 'jiangmiao/auto-pairs'
Plug 'morhetz/gruvbox'
" Clojure stuff
Plug 'guns/vim-clojure-static'
Plug 'luochen1990/rainbow'
Plug 'tpope/vim-fireplace'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
call plug#end()

" use old regexp engine
set regexpengine=1

" leader
let mapleader=" "                   " use space as leader
inoremap jk <ESC>                   " quickly exit insert mode
map ; :
map <Leader>sh :SemanticHighlightToggle<CR>
map <Leader>p :CtrlP<CR>

" Rainbow parens
let g:rainbow_active = 1

" Tagbar
nmap <Leader>tt :TagbarToggle<CR>

" NERDTree
map <Leader>nt :NERDTreeToggle<CR>  " open a file brower buffer

" Open a NERDTree split if vim is started with no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close vim if the only window is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" splits
nnoremap <Leader>h <C-w>h           " move to left split
nnoremap <Leader>j <C-w>j           " move to bottom split
nnoremap <Leader>k <C-w>k           " move to top split
nnoremap <Leader>l <C-w>l           " move to right split
nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>

" colors!
syntax on                           " always use syntax highlighting
let g:gruvbox_termcolors=16
colorscheme gruvbox
set background=dark

" don't bother with powerline glyphs
let g:airline_powerline_fonts=1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='gruvbox'

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
set clipboard=unnamed               " use the system clipboard

" filetype settings
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
