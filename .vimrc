" Vim Configuration File
" Author: Benedikt Bast
" Version 0.3

" UTF8-Encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

" disable vi compatibility
set nocompatible

" syntax highlighting
" set terminal color as variable
let termColors=system('tput colors')

"set wombat only if terminal supports 256 colors
if termColors == 256
	colorscheme wombat256mod 
else
	colorscheme darkblue
endif
syntax on

" further color configuration
set cursorline
hi CursorLine   cterm=NONE ctermbg=darkblue ctermfg=white guibg=darkblue guifg=white
set hlsearch
hi Search guibg=yellow

" line numbers
set relativenumber
set numberwidth=4

" tabwidth 
set shiftwidth=4
set tabstop=4
set noexpandtab
set list
set listchars=tab:▸\ ,eol:¬
" expand tabs to spaces, using softtabs
" not very useful vor makefiles :P
"set softtabstop=4
"set expandtab

" highlighting for braces
set showmatch

" intelligent comments
set formatoptions+=r
set comments=sl:/*,mb:\ *,elx:\ */

" set customs highlightings for statusbar
hi User1 ctermbg=red ctermfg=white guibg=red guifg=white

" add more information to status bar
set statusline=%1*		"switch to highlight 1"
set statusline+=%F		"full filename
"set statusline=%t		"tail of the filename
set statusline+=%*		"switch back to normal statusline highlight
set statusline+=\ [%{strlen(&fenc)?&fenc:'none'},		"file encoding
set statusline+=%{&ff}]		"file format
set statusline+=%h		"help file flag
set statusline+=%m		"modified flag
set statusline+=%r		"read only flag
set statusline+=%y		"filetype
set statusline+=[Size:%{FileSize()}]
set statusline+=%=		"left/right separator
set statusline+=%c,		"cursor column
set statusline+=%l/%L	"cursor line/total lines
set statusline+=\ %P	"percent through file

" filesize function for statusbar
function! FileSize()
	let bytes = getfsize(expand("%:p"))
	if bytes <= 0
		return ""
	endif
	if bytes < 1024
		return bytes
	else
		return (bytes / 1024) . "K"
	endif
endfunction

"no need for the roler due to the great statusbar
"set ruler

set wildmenu
set showcmd
set laststatus=2
