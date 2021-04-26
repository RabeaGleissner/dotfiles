set nocompatible

syntax on
filetype plugin indent on

set encoding=utf8
set nosmartindent
set modelines=0

set background=dark
set hidden
set backspace=indent,eol,start
set noswapfile
set autoindent " automatically set indent of new line
set mouse=a "switch on mouse scrolling
" disable Q for not automatically entering Ex mode
nnoremap Q <nop>
" highlight found words on search
set hlsearch

" show file path in status line
set statusline+=%F
" Hightlight current line
set cursorline

" change cursor shape for insert mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" remapping commands
" set leader to space
let mapleader=" "

" automatically save when escaping insert mode
inoremap <Esc> <Esc>:w<CR>

" remap jf to escape
inoremap jf <Esc>:w<CR>

" show in NerdTree
map <leader>nf <Esc>:NERDTreeFind<cr>

" fit specific test
map <leader>fit <Esc>/^\s*it(<cr>N0f(i.only<Esc>

" unfit specific test
map <leader>unfit <Esc>/^\s*it.only(<cr>fodiwhx<Esc>

" remove highlighting with leader j
map <leader>j <Esc>:noh<CR>

" set nopaste with leader np
map <leader>np <Esc>:set nopaste<CR>

"  eliminate white space with leader ;
nnoremap <leader>; mz:%s/\s\+$//<cr>:let @/=''<cr>`z<cr>:w<cr>

" shortcuts for fzf
map <c-p> :GFiles<CR>
map <leader>h :History<CR>
map <leader>g :GFiles?<CR>

" indent entire page"
map <Leader>i mzgg=G`z

"navigating splits more easily
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"show line number
set number

"use mac clipboard to copy and paste between other applications and vim
set clipboard+=unnamedplus

colorscheme wellsokai

set expandtab
set tabstop=2
set shiftwidth=2

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
nmap cll yiwocll<Esc>pF(a'<Esc>lyiwea', <Esc>p<Esc>
" add stars
imap cstar console.log('***********************');<Esc>
" stars from normal mode
nmap clo yiwocstar<Esc>p ")
" JavaScript try/catch block
nmap trca otry {<Esc>li<Enter><Esc>A catch (err<Esc>la {<Enter><Esc>kk
" JavaScript object one line to multi line
nmap ml V:s/, /,<C-v><Enter>/g<Enter><C-o>f{a<Enter><Esc>vi{=

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
Plug 'leafgarland/typescript-vim'
call plug#end()
