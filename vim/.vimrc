" {{{ Plugins
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'junegunn/fzf'
  nnoremap ,f :FZF<cr>

Plug 'rstacruz/vim-closer'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
  nnoremap ,m :Dispatch<CR>

Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'

Plug 'romainl/Apprentice'
call plug#end()
" }}}

" {{{ Settings
filetype plugin indent on
syntax on

set backspace=indent,eol,start
set clipboard^=unnamed
set cursorline
set expandtab
set foldmethod=marker
set hidden
set hlsearch
set incsearch
set laststatus=2
set nobackup
set noshowmode
set noswapfile
set path=.,**
set shiftwidth=4
set softtabstop=4
set tabstop=4
set wildmenu
" }}}

" {{{ Mappings
nnoremap co :Copen<CR>
nnoremap cc :cclose<CR>
nnoremap cn :cnext<CR>
nnoremap cp :cprev<CR>

nnoremap ,b :ls<cr>:b<space>
nnoremap <silent> ,n :set number!<cr> \| :set relativenumber!<cr>
" }}}

" {{{ Statusbar
function! UserHighlights() abort
  highlight User1 ctermbg=8
  highlight User2 ctermbg=0
  highlight User3 ctermbg=2 ctermfg=0
  highlight User4 ctermbg=6 ctermfg=0
  highlight User5 ctermbg=5
  highlight User6 ctermbg=3 ctermfg=0
endfunction

augroup MyColors
  autocmd!
  autocmd ColorScheme * call UserHighlights()
augroup END

colorscheme apprentice

let s:modes = {
    \ 'n': '%3* NORMAL ',
    \ 'i': '%4* INSERT ',
    \ 'v': '%5* VISUAL ',
    \ 'r': '%6* RPLACE ',
    \ }

function! Statusline()
  let status=""
  let status.=get(s:modes, tolower(mode()), '%* ------ ')
  let status.="%1* %f "
  let status.="%2* %m "
  let status.="%= "
  let status.="%{fugitive#head()} "
  let status.="%y %1* %04.l:%03.c %P "

  return status
endfunction

set statusline=%!Statusline()
" }}}
