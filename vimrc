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

" Appearance
set hlsearch            " show search
set incsearch           " incremental search
set number              " show linenumbers
set laststatus=2        " always show status line
set statusline=%t\ %y\ %{&ff};\ [%c,%l]


" Backup and Files {{{
set backup                          " turn backups on
set undodir=~/.vim/tmp/undo//       " save undo files here
set backupdir=~/.vim/tmp/backup//   " save backup files here
set directory=~/.vim/tmp/swap//     " save swap files here

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif
" }}}

" Tabstops
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set clipboard=unnamed   " Copy to system pasteboard
set hidden              " buffer management

" Scripts
" Show highlighting groups for current word
" kudos to http://vimcasts.org/e/25
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
