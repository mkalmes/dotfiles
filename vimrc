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
