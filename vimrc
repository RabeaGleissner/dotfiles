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
set wildignore+=**/node_modules

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
" ctrlP fuzzy searching files
let g:ctrlp_map = '<c-p>'
" use ag to search for files to improve speed
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

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

"vim-go settings
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
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

call plug#begin('~/.vim/plugged')
Plug 'raimondi/delimitMate'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'cakebaker/scss-syntax.vim'
Plug 'vim-syntastic/syntastic'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-dispatch'
Plug 'elixir-lang/vim-elixir'
Plug 'tpope/vim-endwise'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-surround'
Plug 'fatih/vim-go'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'w0rp/ale'
call plug#end()
