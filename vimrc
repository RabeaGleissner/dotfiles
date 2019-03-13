set nocompatible

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
set mouse=a "switch on mouse scrolling
" disable Q for not automatically entering Ex mode
nnoremap Q <nop>

" show file path in status line
set statusline+=%F
" Hightlight current line
set cursorline

" change cursor shape for insert mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" remapping commands
" my leader is space
let mapleader=" "
" automatically save when escaping insert mode
inoremap <Esc> <Esc>:w<CR>
" remap jf to escape
inoremap jf <Esc>:w<CR>

"  eliminate white space
nnoremap <leader>; mz:%s/\s\+$//<cr>:let @/=''<cr>`z<cr>:w<cr>

" shortcuts for fzf
map <c-p> :GFiles<CR>
map <leader>h :History<CR>
map <leader>g :GFiles?<CR>

" indent entire page"
map <Leader>i mzgg=G`z

" Shorcuts for running tests
" Ruby
" run tests with leader + t (tests open in new pane with vim-dispatch)
autocmd Filetype ruby map <leader>t :Dispatch rspec spec<CR>
" Run vim-dispatch for the specific test where the line cursor is on
autocmd Filetype ruby map <leader>tt :execute "Dispatch rspec %:" . line(".")<CR>
" Run all rspec tests including slow tests on full screen
autocmd Filetype ruby map <leader>aft :! clear; rspec spec/ <cr>
" Run rspec without the slow tests on full screen
autocmd Filetype ruby map <leader>ft :! clear; rspec --tag '~slow' spec/ <cr>
"Elixir
"Run ExUnit tests on full screen with leader + ft
autocmd Filetype elixir map <leader>ft :! clear; mix test<cr>
"run ExUnit tests with leader + t in vim-dispatch
autocmd Filetype elixir map <leader>t :Dispatch mix test<CR>
"PHP
"Run PHPUnit tests on full screen with leader + ft
autocmd Filetype php map <leader>ft :! clear; vendor/bin/phpunit test<cr>
"run PHPUnit tests with leader + t in vim-dispatch
autocmd Filetype php map <leader>t :Dispatch vendor/bin/phpunit test<CR>

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
"autocmd Filetype javascript setlocal ts=4 sw=4 expandtab
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

"enable syntax highlighting
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

"Syntastic default settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"Enable jsx syntax highlighting for any js file
let g:jsx_ext_required = 0

"Hash rocket
imap <C-L> <SPACE>=><SPACE>

"snippets for console.log
" Console log from insert mode; Puts focus inside parentheses
imap cll console.log();<Esc>==f(a
" Console log from visual mode on next line, puts visual selection inside parentheses
vmap cll yocll<Esc>p
" Console log from normal mode, inserted on next line with word your on inside parentheses
nmap cll yiwocll<Esc>p ")

"enable fzf (needs to be brew installed first)
set rtp+=/usr/local/opt/fzf

call plug#begin('~/.vim/plugged')
Plug 'raimondi/delimitMate'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'cakebaker/scss-syntax.vim'
Plug 'vim-syntastic/syntastic'
Plug 'ntpeters/vim-better-whitespace'
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'tpope/vim-endwise'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf.vim'
Plug 'BurntSushi/ripgrep'
call plug#end()
