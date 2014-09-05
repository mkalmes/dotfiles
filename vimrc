" Vim configuration
" by mkalmes

" Preamble {{{
set nocompatible        " vim is not compatible to vi
filetype off
" }}}

" Vundle {{{
"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

syntax enable           " enable syntax higlighting
" }}}

" Basic options
set encoding=utf-8
set modelines=0
set autoindent
set scrolloff=3
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set undofile

" Handle long lines
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

" Show invisibles
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮

" Learn vim the right way(tm)
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" Make your live easier
nnoremap ; :

" Folding
set foldlevelstart=2
set foldmethod=marker
