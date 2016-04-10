set nocompatible

execute pathogen#infect()
syntax on
filetype plugin indent on

set encoding=utf8
set nosmartindent
set autoindent
set modelines=0

set background=dark
set hidden
set backspace=indent,eol,start
set noswapfile
set autoindent " automatically set indent of new line

"show file path in status line
set statusline+=%F
" Hightlight current line
set cursorline

"change cursor shape for insert mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

"remapping commands
"my leader is space
let mapleader=" "
"automatically save when escaping insert mode
inoremap <Esc> <Esc>:w<CR>
" remap jf to escape
inoremap jf <Esc>:w<CR>
"hit enter to insert a new line without going into insert mode
nmap <CR> o<ESC>
"run tests with leader + t (tests open in new pane with vim-dispatch)
map <leader>t :Dispatch rspec spec<CR>
" Run vim-dispatch for the specific test where the line cursor is on
map <leader>tt :execute "Dispatch rspec %:" . line(".")<CR>
"Run rspec without the slow tests and take over the whole screen
map <leader>ft :! clear; rspec --tag '~slow' spec/ <cr>
"Run all rspec tests including slow tests and take over the whole screen
map <leader>aft :! clear; rspec spec/ <cr>
"ctrlP fuzzy searching files
let g:ctrlp_map = '<c-p>'
"indent entire page"
map <Leader>i mzgg=G`z

"navigating splits more easily
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"show line number
set number

"use mac clipboard to copy and paste between other applications and vim
set clipboard+=unnamed

colorscheme wellsokai

set expandtab
set tabstop=2
set shiftwidth=2

"indentation
"autocmd Filetype html setlocal ts=2 sw=2 expandtab
"autocmd Filetype css setlocal ts=2 sw=2 expandtab
"autocmd Filetype scss setlocal ts=2 sw=2 expandtab
"autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=4 sw=4 expandtab
autocmd Filetype java setlocal ts=4 sw=4 expandtab

"white space highlighting
highlight ExtraWhitespace ctermbg=blue

"line breaks
set wrap
set linebreak
set nolist  "list disables linebreak
set textwidth=0
set wrapmargin=0

"spell check
"set spell check for markdown files only
autocmd FileType markdown setlocal spell spelllang=en_gb
"turn on spell check
set spellfile=$HOME/.vim-spell-en.utf-8.add
set complete+=kspell

"open nerdtree using Ctrl+n
map <C-n> :NERDTreeToggle<CR>
"show hidden files by default
let NERDTreeShowHidden=1

"no arrow keys in normal, insert, visual modes
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
vnoremap <up> <nop>
vnoremap <up> <nop>
vnoremap <up> <nop>
vnoremap <up> <nop>
noremap j gj
noremap k gk
noremap gj j
noremap gk k
