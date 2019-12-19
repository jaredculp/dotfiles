filetype plugin indent on
syntax on

call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
call plug#end()

colorscheme gruvbox
set background=dark

set autoindent
set backspace=indent,eol,start
set clipboard^=unnamed
set expandtab
set grepformat=%f:%l:%c:%m
set grepprg=rg\ --vimgrep
set hidden
set incsearch
set number
set path=**
set relativenumber
set shiftwidth=2
set splitbelow
set splitright
set tabstop=2
set wildmenu
set wildignore+=*/target/*

nnoremap ,g :grep<space>
nnoremap ,e :e **/
nnoremap ,b :ls<cr>:b<space>
nnoremap ,q :b#<cr>

" left:  current mode, filename, git branch
" right: column number, line number
set statusline+=%#LineNR#\ %{toupper(mode())}\ %f\ %{fugitive#head()}%=%3c:%3l
