""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Configuration File
" Author: Benedikt Bast
" https://github.com/benediktbast
" Last Change: 2017/10/25
""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""
" Basic Settings
""""""""""""""""""""""""""""""""""""""""""""""""
set enc=utf-8					" Set ecoding to UTF-8
set fenc=utf-8					" Set file encoding
set termencoding=utf-8				" Set terminal encoding
set nocompatible				" Disable vi compatibility


""""""""""""""""""""""""""""""""""""""""""""""""
" Colors
""""""""""""""""""""""""""""""""""""""""""""""""
syntax on					" Enable syntax highlighting
let termColors=system('tput colors')		" Set terminal color commmand as variable

set cursorline					" Highlight cursor line and set colors

if termColors == 256				" Use a beautiful color scheme if
    colorscheme wombat256mod			" If the terminal supports 265 colors
else						" Else use a fallback scheme
	colorscheme blue			" and custom cursor line
	hi CursorLine	cterm=NONE ctermbg=white ctermfg=darkblue
endif

set hlsearch					" Hightlight search matches and set colors
hi Search guibg=yellow


""""""""""""""""""""""""""""""""""""""""""""""""
" Text format functions
""""""""""""""""""""""""""""""""""""""""""""""""

" Define formatting rules for Linux Kernel conventions
function! LinuxTextFormat() 
	set noexpandtab				" Use hard tabs
	set shiftwidth=8			" Text ident to 8 spaces
	set tabstop=8				" Define hard tab width as 8 spaces
endfunction
:command Linux :call LinuxTextFormat()		" Command alias

" Define formatting for Java conventions
function! JavaTextFormat()
	set expandtab				" No hard tabs
	set shiftwidth=4			" Text ident to 4 spaces
	set softtabstop=4			" Expand soft tabs 4 spaces
endfunction
:command Java :call JavaTextFormat()		" Command alias

" Default formatting 
function! DefaultTextFormat()
	call LinuxTextFormat()			" Your preferred default Style
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""
" Text formating
""""""""""""""""""""""""""""""""""""""""""""""""

call DefaultTextFormat()			" Set default style

set smarttab					" Align Tabs

set list					" Display tabs and end of line
set listchars=tab:▸\ ,eol:¬

set showmatch					" Highlight matching braces

set formatoptions+=r				" Recognize code comments
set comments=sl:/*,mb:\ *,elx:\ */


""""""""""""""""""""""""""""""""""""""""""""""""
" User Interface
""""""""""""""""""""""""""""""""""""""""""""""""

set relativenumber				" Use relative line numbers
set numberwidth=4				" Allow width of the line number column up to 4 chars
set scrolloff=6					" Set offset when moving vertically
set incsearch					" Show search matching while typing
set ignorecase					" Search case insensitive
set showcmd					" Show vim command in the last line of screen
set showmode					" Always show current mode
set noerrorbells				" Do not beep
set novisualbell				" Do not beep

set wildmenu					" Set tab completion for commands or files
"set wildmode=list:full				" Show list list for tab completion
set wildignore=*.swp,*.o,*~,			" Ignore some stuff for completion
if has("win16") || has("win32")
    set wildignore+=.git\*
else
    set wildignore+=*/.git/*,*/.DS_Store
endif


""""""""""""""""""""""""""""""""""""""""""""""""
" Statusbar
""""""""""""""""""""""""""""""""""""""""""""""""

" Custom Highlight 1 for filename
hi User1 ctermbg=red ctermfg=white guibg=red guifg=white

set laststatus=2				" always show status line

" add more information to status bar
set statusline=%1*				" Use predefined Highlight 1
set statusline+=%F\				" Full filename
"set statusline=%t				" Tail of the filename
set statusline+=%*				" Switch back to normal statusline
set statusline+=\ [%{strlen(&fenc)?&fenc:'none'},   " File encoding
set statusline+=%{&ff}]				" File format
set statusline+=%h				" Help file flag
set statusline+=%m				" Modified flag
set statusline+=%r				" Read only flag
set statusline+=%y				" File type
set statusline+=[Size:%{FileSize()}]		" File size
"set statusline+=%{GitStatusBar()}		" Git information
set statusline+=%=				" Left/right separator
set statusline+=%c,				" Cursor position
set statusline+=%l/%L				" Cursor line / total lines
set statusline+=\ %P				" Percent through file

"set ruler					" No need for the ruler due to the great statusbar

""""""""""""""""""""""""""""""""""""""""""""""""
" Statusbar functions
""""""""""""""""""""""""""""""""""""""""""""""""

" Filesize function
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

" Git Branch Function
function! GitBranch()
    return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! GitDirty()
    let l:gitStatus = system("git status -s 2>/dev/null")
    return strlen(l:gitStatus) > 0?' *':''
endfunction

function! GitStatusBar()
    let l:branch = GitBranch()
    let l:dirty = GitDirty()
    return strlen(l:branch) > 0?' ⎇  '.l:branch.l:dirty.'  ':''
endfunction
