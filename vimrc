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
:set wrap
:set linebreak
:set nolist  " list disables linebreak

" faster!
set lazyredraw
set ttyfast

set path=$PWD/**

set pastetoggle=<f5>

map <F6> :set wrap!<cr>

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

" move through wraped lines
nnoremap k gk
nnoremap j gj


" src: http://vim.wikia.com/wiki/Faster_loading_of_large_files
" file is large from 20mb
let g:LargeFile = 1024 * 1024 * 50
augroup LargeFile 
 autocmd BufReadPre * let f=getfsize(expand("<afile>")) | if f > g:LargeFile || f == -2 | call LargeFile() | endif
augroup END

function LargeFile()
 " no syntax highlighting etc
 set eventignore+=FileType
 " save memory when other file is viewed
 setlocal bufhidden=unload
 " is read-only (write with :w new_filename)
 setlocal buftype=nowrite
 " no undo possible
 setlocal undolevels=-1
 " display message
 autocmd VimEnter *  echo "The file is larger than " . (g:LargeFile / 1024 / 1024) . " MB, so some options are changed (see .vimrc for details)."
endfunction
