call plug#begin(stdpath('data') . '/plugged')
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

set clipboard^=unnamed
set grepformat=%f:%l:%c:%m
set grepprg=rg\ --vimgrep
set hidden
set number
set path=**
set relativenumber
set splitbelow
set splitright
set wildignore+=*/target/*

nnoremap ,g :grep<space>
nnoremap ,e :e **/
nnoremap ,b :ls<cr>:b<space>
nnoremap ,q :b#<cr>

" left:  current mode, filename, git branch
" right: column number, line number
set statusline+=%#LineNR#\ %{toupper(mode())}\ %f\ %{fugitive#head()}%=%3c:%3l
