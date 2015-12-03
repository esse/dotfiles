execute pathogen#infect()
syntax on
filetype plugin indent on
set clipboard=unnamed

set ts=2                    " Tabs are 2 spaces
set bs=2                    " Backspace over everything in insert mode
set tabstop=2 shiftwidth=2  " Tabs under smart indent
set expandtab               " use spaces, not tabs
set smarttab

set ruler                   " Ruler on
set nu                      " Line numbers on
set nowrap                  " Line wrapping off
set timeoutlen=250          " Time to wait after ESC (default causes an annoying delay)
set term=xterm-256color

set mouse=a

" faster!
set lazyredraw
set ttyfast

set path=$PWD/**

set pastetoggle=<f5>

map <C-n> :NERDTreeToggle<CR>

filetype plugin indent on     " required! 

"fix issue with tmux
map <Esc>[B <Down>
map <Esc>[A <Up>
map <Esc>[C <Right>
map <Esc>[D <Left>

cmap <Esc>[A <Up>
cmap <Esc>[B <Down>
cmap <Esc>[C <Right>
cmap <Esc>[D <Left>

map! <Esc>[B <Down>
map! <Esc>[A <Up>
map! <Esc>[C <Right>
map! <Esc>[D <Left>


set nocp incsearch          
set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case
set formatoptions=tcqr
set cindent
set autoindent

syntax on                   " Colors in OSX
" TEX files set wrap
:autocmd BufNewFile,BufRead *.tex set wrap
" HTML files set wrap
:autocmd BufNewFile,BufRead *.html set wrap
" TXT files set wrap
:autocmd BufNewFile,BufRead *.txt set wrap

" Go lang
filetype plugin indent off
set runtimepath+=/usr/local/go/misc/vim
let g:go_fmt_command = "goimports"
filetype plugin indent on
syntax on
map <C-w>t :GoTest<CR>

