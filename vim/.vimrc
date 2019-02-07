filetype plugin indent on
syntax enable

" look and feel
set backspace=indent,eol,start
set clipboard^=unnamed
set laststatus=2
set number
set ruler
colorscheme PaperColor

" tabs are 2 spaces, always
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

" buffers
set autoread
set hidden
nnoremap ,b :ls<cr>:b<space>
nnoremap ,q :b#<cr>

" navigation
set path+=**
set wildmenu
nnoremap ,e :e **/
set grepprg=ag\ --vimgrep
set grepformat=%f:%l:%c:%m
nnoremap ,g :grep<space>

" errors
nnoremap co :copen<CR>
nnoremap cc :cclose<CR>
nnoremap cn :cnext<CR>
nnoremap cp :cprev<CR>
