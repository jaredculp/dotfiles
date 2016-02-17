call plug#begin('~/.vim/plugged')
if filereadable(expand("~/.vimrc.plugs"))
  source ~/.vimrc.plugs
endif
call plug#end()

" use old regexp engine
set regexpengine=1

" leader
let mapleader=" "                   " use space as leader
map ; :

" Switch between the last two files
nnoremap <Leader><Leader> <c-^>

" quickly exit insert mode
inoremap jk <ESC>
map <Leader>p :CtrlP<CR>

" Rainbow parens
let g:rainbow_active = 1

" Tags
nmap <Leader>tt :TagbarToggle<CR>

" Ag
noremap <Leader>g :Ag<CR>

" splits
set splitbelow
set splitright
nnoremap <Leader>v :vsplit<CR>
nnoremap <Leader>s :split<CR>
nnoremap <Leader>h <C-w>h           " move to left split
nnoremap <Leader>j <C-w>j           " move to bottom split
nnoremap <Leader>k <C-w>k           " move to top split
nnoremap <Leader>l <C-w>l           " move to right split

" colors!
syntax on                           " always use syntax highlighting
colorscheme solarized
set background=dark

" fonts
set guifont=Monaco:h14
let g:airline_left_sep=''
let g:airline_right_sep=''

" set some defaults
set nowrap                          " don't wrap lines
set expandtab                       " tabs are evil
set tabstop=2                       " read tab characters as two spaces
set softtabstop=2                   " a tab is two space
                                    "    also makes a backspace remove 2 chars
set shiftwidth=2                    " number of spaces to use for autoindenting
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
set iskeyword-=_                    " allow movement by word to include underscores
set clipboard=unnamed               " use the system clipboard

" filetype settings
autocmd Filetype ruby setlocal colorcolumn=80
autocmd Filetype java setlocal ts=4 sts=4 sw=4 colorcolumn=128
