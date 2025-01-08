set nocompatible

syntax on

set encoding=utf8
set modelines=0

filetype plugin indent on
set backspace=indent,eol,start
set autoindent

set background=dark
set hidden
set noswapfile
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


let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint'],
\   'typescript': ['prettier', 'eslint'],
\}

map <leader>af :ALEFix<CR>

"open nerdtree using Ctrl+n
map <C-n> :NERDTreeToggle<CR>
"show hidden files by default
let NERDTreeShowHidden=1

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
nmap clo yiwocstar<Esc>hi, <ESC>p ")
" JavaScript try/catch block
nmap trca otry {<Esc>li<Enter><Esc>A catch (err<Esc>la {<Enter><Esc>kk
" JavaScript object one line to multi line
nmap ml V:s/, /,<C-v><Enter>/g<Enter><C-o>f{a<Enter><Esc>vi{=

" Elixir debugging log
nmap puts oIO.puts("\n***************************")<Esc>odbg()<Esc>i

" Elixir inspect in pipeline
nmap pi o\|> dbg()<Esc>

" eex tag
nmap eex o<%= %><Esc>F=

" end tag
nmap end o<% end %><Esc>

" use ripgrep to search files with ctrlp
if executable('rg')
  let g:ctrlp_user_command = 'rg %s --files --hidden --color=never --glob ""'
endif
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|node_modules\|deps\|build\|coverage\|log\|tmp$',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }
"find dotfiles
let g:ctrlp_show_hidden = 1
"supposed to make it faster
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40

"need to create a .vim/coAuthors file for this
"example syntax:
"nmap shortcutname oCo-authored-by: First Last <first.last@example.com><Esc>
" source ~/.vim/coAuthors.vim

"Fixes for vim-elixir plugin not detecting filetypes
au BufRead,BufNewFile *.ex,*.exs set filetype=elixir
au BufRead,BufNewFile *.eex,*.heex,*.leex,*.sface,*.lexs set filetype=eelixir
au BufRead,BufNewFile mix.lock set filetype=elixir

call plug#begin('~/.vim/plugged')
Plug 'raimondi/delimitMate'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-syntastic/syntastic'
Plug 'ntpeters/vim-better-whitespace'
Plug 'slashmili/alchemist.vim'
Plug 'tpope/vim-surround'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'BurntSushi/ripgrep'
Plug 'tpope/vim-endwise'
Plug 'elixir-editors/vim-elixir'
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'github/copilot.vim'
call plug#end()
