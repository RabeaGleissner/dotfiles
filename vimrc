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

"show file path in status line
set statusline+=%F
" Hightlight current line
set cursorline

"change cursor shape for insert mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

"remapping commands
"automatically save when escaping insert mode
inoremap <Esc> <Esc>:w<CR>
"hit enter to insert a new line without going into insert mode
nmap <CR> o<ESC>
"my leader is space
let mapleader=" "
"run tests with leader + t
map <leader>t :! clear; rspec spec; <cr>

"show line number
set number

colorscheme wellsokai

set expandtab
set tabstop=4
set shiftwidth=4

"indentation
autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype css setlocal ts=2 sw=2 expandtab
autocmd Filetype scss setlocal ts=2 sw=2 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
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
