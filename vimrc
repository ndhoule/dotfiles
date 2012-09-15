" -------------------------------------
" Key bindings
" -------------------------------------
" Get rid of the arrow keys for vim hardtime
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
" Get rid of the F1 key to avoid that shit help menu
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
" Make ; do the same thing as :
nnoremap ; :


" -------------------------------------
" Text format and display
" -------------------------------------
"set wrap                " Wrap dat
"set textwidth=79        " Wrap dat at 79 
set colorcolumn=85      " Show a column at 85 to show when I'm being verbose
if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on
endif
set expandtab           " <Tab> key gets turned into spaces indicated in tabstop
set tabstop=4           " Set tab width to four spaces
set softtabstop=4       " Make tabs easier to delete
set shiftwidth=4        " Autoindent indents this many spaces
set number              " Turn on line numbering and a hotkey to hide it
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>


" -------------------------------------
" Miscellaneous
" -------------------------------------
set encoding=utf-8      " I liek utf8
set scrolloff=3         " Start scrolling three lines from the bottom
set showmode
set showcmd
syntax on               " Turn syntax highlighting on
filetype off            " Turn plugins on so we can turn pathogen on
call pathogen#runtime_append_all_bundles() " Turn on the pathogen plugin
filetype plugin on      " Turn plugins back on
set nocompatible        " That shit cray
set modelines=0         " Get rid of modelines for security or something
"set undofile            " Enable vim FILENAME.un~ undo files to undo after close
set relativenumber      " Set line numbering relative to current line
set clipboard=unnamedplus "Copy to system clipboard by default


" -------------------------------------
" Highlighting, spellcheck, search, etc
" -------------------------------------
"set spell              " Set spellcheck
set spelllang=en        " Set spelling to English


" -------------------------------------
" Search and destro--er, replace
" -------------------------------------
set hls                 " Highlight search items
set ignorecase          " Ignore case when searching...
set smartcase           " ...Except when search pattern contains an uppercase char
set gdefault            " Global search and replace by default


" -------------------------------------
" Change vim colorz
" -------------------------------------
" IMPORTANT: Uncomment one of the following lines to force
" using 256 colors (or 88 colors) if your terminal supports it,
" but does not automatically use 256 colors by default.
set t_Co=256



" -------------------------------------
" External programs
" -------------------------------------
" Convert markdown to HTML by typing :md
" nmap <leader>md :%!/usr/bin/markdown_py<cr>
" Convert markdown to HTML by typing :md
"nmap <leader>:md :%!/usr/bin/markdown_py<cr>

function MarkdownToHTML()
    :%!/usr/bin/markdown_py
endfunction

cmap Md call MarkdownToHTML()<cr>



" -------------------------------------
" Python autocompletion
" -------------------------------------
autocmd FileType html set omnifunc=htmlcomplete#Complete
let g:pydiction_location = '/usr/share/pydiction/complete-dict'
