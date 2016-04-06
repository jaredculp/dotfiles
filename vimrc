" plugins
call plug#begin('~/.vim/plugged')
if filereadable(expand("~/.vimrc.plugs"))
  source ~/.vimrc.plugs
endif
call plug#end()

" leader
let mapleader=" "                   " use space as leader
map ; :

" colors!
let base16colorspace=256
colorscheme base16-ocean
set background=dark

" fonts
set guifont=Monaco:h14
let g:airline_left_sep=''
let g:airline_right_sep=''

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

set splitbelow                      " open new windows below current
set splitright                      " open new windows to right of current

set ttyfast                         " faster redrawing
set lazyredraw                      " only redraw when necessary

" put all temporary files under the same directory.
" https://github.com/mhinz/vim-galore#handling-backup-swap-undo-and-viminfo-files
set backup
set backupdir   =$HOME/.vim/files/backup/
set backupext   =-vimbackup
set backupskip  =
set directory   =$HOME/.vim/files/swap//
set updatecount =100
set undofile
set undodir     =$HOME/.vim/files/undo/
set viminfo     ='100,n$HOME/.vim/files/info/viminfo
