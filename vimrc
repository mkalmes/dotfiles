" Vim configuration
" by mkalmes

" Basic Setup
set nocompatible		" vim is not compatible to vi
syntax enable			" enable syntax higlighting


" Appearance
set tw=120				" width of 120 chars
set hlsearch			" show search       
set incsearch			" incremental search
set number				" show linenumbers
set laststatus=2		" always show status line
set statusline=%t\ %y\ %{&ff};\ [%c,%l]


" Backup and Files
set backup					" turn backups on
set backupdir=/tmp	" save backup files here
set directory=/tmp	" save swap files here


" Tabstops (use hard tabs)
set shiftwidth=4		" 4 spaces to use for each step of (auto)indent.
set tabstop=4			" 4 spaces for one <Tab> 
set noexpandtab			" Use a real <Tab>

set clipboard=unnamed	" Copy to system pasteboard
set hidden				" buffer management

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