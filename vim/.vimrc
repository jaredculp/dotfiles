"
" .vimrc
"

" plugins
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-endwise'

Plug 'ctrlpvim/ctrlp.vim'

Plug 'ntpeters/vim-better-whitespace'
Plug 'airblade/vim-gitgutter'

Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}
call plug#end()

" general
set nocompatible
set number
set hlsearch
set ignorecase
set smartcase
set noswapfile
set nobackup
set autowrite
set clipboard^=unnamed,unnamedplus
set expandtab

" tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" colors
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" leader
let mapleader = ","
nnoremap <leader>p :CtrlP<cr>

" splits
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" quickly exit insert mode
imap jk <Esc>

" stupid q: window
map q: :q

" go
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1

autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#cmd#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

