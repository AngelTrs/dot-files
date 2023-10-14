set nocompatible
filetype off

" https://github.com/junegunn/vim-plug
call plug#begin('~/.config/nvim/plugged')
  Plug 'sheerun/vim-polyglot'
  Plug 'jiangmiao/auto-pairs' 
  Plug 'Yggdroot/indentLine'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'andymass/vim-matchup'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/fzf.vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
call plug#end()

set autoindent              " indent a new line the same amount as prev line
set number									" show line numbers
set ignorecase              " case insensitive
set smartcase								" Don't ignore case when search has capital letter
set showmatch               " show matching 
set hlsearch                " highlight search 
set tabstop=2               " number of columns occupied by a tab 
set softtabstop=2						" see multiple spaces as tabstops so <BS> 
set shiftwidth=2            " width for autoindents
set cc=80                   " set an 80 column border for good coding style
set clipboard+=unnamedplus  " using system clipboard
set mouse=a  								" Enable mouse for scrolling and window resizing.
set breakindent             " Preseve indent on wrapped lines
set backspace=indent,eol,start
set hidden
set timeoutlen=1500        " keypress timeout keypress timeout
set laststatus=2
set title
set splitbelow
set splitright

filetype plugin indent on   "allow auto-indenting depending on file type

if (has("termguicolors"))
  set termguicolors
endif

colorscheme desert

let g:airline_theme='fruit_punch'
let g:airline#extensions#tabline#enabled = 1

let mapleader=","

" init.vim
nmap <leader>rc :vsplit $MYVIMRC<cr>
nmap <leader>src :source $MYVIMRC<cr>

" writes and quits
nmap <leader>w :w<cr>
nmap <leader>q :q<cr>
nmap zz :up<cr>
nmap CQ :cq<cr>

" navigation
map <Up> <Nop>                                                              
map <Down> <Nop>                                                            
map <Left> <Nop>                                                          
map <Right> <Nop> 
nmap H 0
nmap L $
nmap <leader>rn :set relativenumber!<cr>

" editing
imap jj <Esc>
imap ;; <esc>A;<esc>
imap ,, <esc>A,<cr>
nmap <leader>;; A;<esc>
nmap Y y$
nmap <silent> <cr> :nohlsearch<cr>

" splits
nmap <leader>sh :split<cr>
nmap <leader>sv :vsplit<cr>
nmap <leader>so :only<cr>
nmap <leader>s? :map <leader>s<cr>

" navigating splits
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-L> <C-W><C-L>
nmap <C-H> <C-W><C-H>

" buffer actions
nmap <leader>bt :enew<cr> 
nmap <leader>bd :bdelete<cr>
nmap <leader>bq :bufdo bdelete<cr>
nmap <leader>bn :bnext<cr>
nmap <leader>bp :bprevious<cr>
nmap <leader>bl :ls<cr>
nmap <leader>b? :map <leader>b<cr>

" plugins
nnoremap <buffer><nowait> <leader>pi <cmd>PlugInstall<cr>
nnoremap <buffer><nowait> <leader>pu <cmd>PlugUpdate<cr>
nnoremap <buffer><nowait> <leader>p? :map <leader>p<cr>

" FZF
nmap <leader>ff :Files ..<cr>
nmap <leader>fg :GFiles<cr>
nmap <leader>fb :Buffers<cr>
nmap <leader>f? :map <leader>f<cr>


" file type specifics
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType py setlocal ts=2 sts=4 sw=4 
