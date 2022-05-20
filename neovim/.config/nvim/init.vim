set nocompatible
filetype off

" https://github.com/junegunn/vim-plug
call plug#begin('~/.config/nvim/plugged')
  Plug 'sheerun/vim-polyglot'
  Plug 'preservim/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  Plug 'preservim/nerdcommenter'
  Plug 'jiangmiao/auto-pairs' 
  Plug 'Yggdroot/indentLine'
  Plug 'tpope/vim-surround'
  Plug 'andymass/vim-matchup'
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

noremap <Up> <Nop>                                                              
noremap <Down> <Nop>                                                            
noremap <Left> <Nop>                                                          
noremap <Right> <Nop> 

imap jj <Esc>
imap jk <Esc>

nmap H 0
nmap L $
nmap zz :up<cr>

let mapleader=","

" split/window actions
nmap <leader>sh :split<cr>
nmap <leader>sv :vsplit<cr>
nmap <leader>s? :map <leader>s<cr>
nmap <leader>so :only<cr>

" buffer actions
nmap <leader>bt :enew<cr>
nmap <leader>bd :bdelete<cr>
nmap <leader>bn :bnext<cr>
nmap <leader>bp :bprevious<cr>
nmap <leader>bl :ls<cr>
nmap <leader>b? :map <leader>b<cr>

nmap <leader>nt :NERDTreeToggle<cr>
nmap <leader>rn :set relativenumber!<cr>

" remove search highlights
nnoremap <silent> <cr> :nohlsearch<cr>

" move up, down, left, right in splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType py setlocal ts=2 sts=4 sw=4 
