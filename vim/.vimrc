" ========== plugins ==========
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'

Plug 'rking/ag.vim'
Plug 'ctrlpvim/ctrlp.vim'

Plug 'ntpeters/vim-better-whitespace'
Plug 'raimondi/delimitmate'

Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}
Plug 'AndrewRadev/splitjoin.vim'
call plug#end()

" ========== config ==========
set nocompatible
filetype plugin indent on

set ttyfast
set ttymouse=xterm2
set ttyscroll=3

set laststatus=2
set encoding=utf-8              " Set default encoding to UTF-8
set autoread                    " Automatically reread changed files without asking me anything
set autoindent
set backspace=indent,eol,start  " Makes backspace key more powerful.
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set mouse=a

set noerrorbells             " No beeps
set number                   " Show line numbers
set showcmd                  " Show me what I'm typing
set noswapfile               " Don't use swapfile
set nobackup                 " Don't create annoying backup files
set splitright               " Split vertical windows right to the current windows
set splitbelow               " Split horizontal windows below to the current windows
set autowrite                " Automatically save before :next, :make etc.
set hidden
set fileformats=unix,dos,mac " Prefer Unix over Windows over OS 9 formats
set noshowmatch              " Do not show matching brackets by flickering
set noshowmode               " We show the mode with airline or lightline
set ignorecase               " Search case insensitive...
set smartcase                " ... but not it begins with upper case
set completeopt=menu,menuone
set nocursorcolumn           " speed up syntax highlighting
set nocursorline
set updatetime=400

set pumheight=10             " Completion window max size

"http://stackoverflow.com/questions/20186975/vim-mac-how-to-copy-to-clipboard-without-pbcopy
set clipboard^=unnamed
set clipboard^=unnamedplus

set viminfo='200

set lazyredraw          " Wait to redraw

" ========== colors ==========
set background=light
set termguicolors
colorscheme gruvbox
let g:lightline = {
  \ 'colorscheme': 'gruvbox',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'fugitive', 'filename' ] ]
  \ },
  \ 'component_function': {
  \   'modified': 'LightLineModified',
  \   'fugitive': 'LightLineFugitive'
  \ }
  \ }

function! LightLineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! LightLineFugitive()
  return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

" ========== leader ==========
let mapleader = ","

" quickfix
map <C-n> :cn<CR>
map <C-m> :cp<CR>
nnoremap <leader>a :cclose<CR>

" fast saving
nnoremap <leader>w :w!<cr>
nnoremap <silent> <leader>q :q!<CR>

" splits
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" quickly exit insert mode
imap jk <Esc>

" stupid q: window
map q: :q

" ctrlp
nnoremap <leader>p :CtrlP<cr>

" snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"
let g:UltiSnipsEditSplit='vertical'

" ========== defaults ==========
set expandtab
set shiftwidth=2
set tabstop=2

" ========== shell ==========
autocmd BufWrite *.sh :Dispatch shellcheck %

" ========== ruby ==========
autocmd BufNewFile,BufRead *.rb setlocal expandtab tabstop=2 shiftwidth=2
autocmd FileType ruby nnoremap <leader>r :Dispatch rspec %<CR>

" ========== vim-go ==========
let g:go_fmt_command = "goimports"

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
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <Leader>i <Plug>(go-info)
let g:go_auto_type_info = 1

" ========== delimitMate ==========
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1

" vim: sw=2 sw=2 et
