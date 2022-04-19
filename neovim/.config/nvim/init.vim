" https://github.com/junegunn/vim-plug

set nocompatible
filetype off

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

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
