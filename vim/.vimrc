if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'fatih/molokai'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
call plug#end()

filetype plugin indent on
syntax on
set autoindent
set backspace=indent,eol,start
set hidden
set incsearch
set laststatus=2
set noshowmode
set number
set path=.,**
set shiftround
set wildmenu
set wildignore+=*.class
set wildignore+=target/*

set clipboard^=unnamed

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

colorscheme molokai

nnoremap ,f :find *

highlight User1 ctermbg=8
highlight User2 ctermbg=7 ctermfg=0
highlight User3 ctermbg=2 ctermfg=0
highlight User4 ctermbg=6 ctermfg=0
highlight User5 ctermbg=5
highlight User6 ctermbg=3 ctermfg=0

let s:modes ={
    \ 'n'  : ['%3*', 'NORMAL'],
    \ 'i'  : ['%4*', 'INSERT'],
    \ 'v'  : ['%5*', 'VISUAL'],
    \ 'r'  : ['%6*', 'REPLACE'],
    \ }

function! ModeColor() abort
  return get(s:modes, tolower(mode()), '%*')[0]
endfunction

function! CurrentMode() abort
  return ' ' . get(s:modes, tolower(mode()), '-')[1] . ' '
endfunction

function! GitBranch()
  let branch=fugitive#head()
  if branch != ''
    return ' ' . branch . ' '
  else
    return ''
  endif
endfunction

function! Statusline()
  let status=""
  let status.=ModeColor()
  let status.=CurrentMode()
  let status.="%1* %f "
  let status.="%2* %m "
  let status.="%= "
  let status.=GitBranch()
  let status.="%y %1* %04.l:%03.c "

  return status
endfunction

set statusline=%!Statusline()
