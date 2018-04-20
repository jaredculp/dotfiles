if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'fatih/molokai'
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

nnoremap ,f :find *

" netrw
nnoremap - :Explore<CR>
let g:netrw_banner=0

function! UserHighlights() abort
  highlight User1 ctermbg=8
  highlight User2 ctermbg=7 ctermfg=0
  highlight User3 ctermbg=2 ctermfg=0
  highlight User4 ctermbg=6 ctermfg=0
  highlight User5 ctermbg=5
  highlight User6 ctermbg=3 ctermfg=0
endfunction

augroup MyColors
  autocmd!
  autocmd ColorScheme * call UserHighlights()
augroup END
colorscheme molokai

let s:modes = {
    \ 'n': '%3* NORMAL ',
    \ 'i': '%4* INSERT ',
    \ 'v': '%5* VISUAL ',
    \ 'r': '%6* RPLACE ',
    \ }

function! CurrentMode() abort
  return get(s:modes, tolower(mode()), '%* ------ ')
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
  let status.=CurrentMode()
  let status.="%1* %f "
  let status.="%2* %m "
  let status.="%= "
  let status.=GitBranch()
  let status.="%y %1* %04.l:%03.c %P "

  return status
endfunction

set statusline=%!Statusline()
