"
" Nathan Houle's ~.vimrc 
"
" I lay claim to no genius contained within; many of these are stolen from or
" inspired by innumerable blog posts, SO threads, the Vim book I'm editing, etc.
"


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

" Prevent F1 from toggling Vim's help menu
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Activate : using ;
nnoremap ; :

" Toggle between regular numbering, relative numbering, no numbering
nmap <silent> <F2> :exec &nu==&rnu? "se nu!" : "se rnu!"<CR>
" 
nmap <silent> <F3> :set hlsearch!<CR>


" -------------------------------------
" Plugins
" -------------------------------------
call pathogen#infect()  " Enable pathogen, autoload plugins from ~/.vim/bundle 


" -------------------------------------
" Text format and display
" -------------------------------------
syntax on               " Turn syntax highlighting on
set relativenumber      " Set line numbering relative to current line
set colorcolumn=85      " Show a column at 85 to show max width
" Enable file type detection, load language-specific indentation files
if has("autocmd")
  filetype plugin indent on
endif
set tabstop=4           " Set tab width to four spaces
set softtabstop=4       " Make tabs easier to delete
set shiftwidth=4        " Auto-indent this many spaces
set expandtab           " Turn <Tab> into spaces indicated in tabstop
set relativenumber      " Set line numbering relative to current line

" -------------------------------------
" Miscellaneous
" -------------------------------------
set encoding=utf-8      " Use UTF8 encoding by default
set scrolloff=3         " Start scrolling three lines from the bottom
set showmode
set showcmd
set nocompatible        " That shit cray
set modelines=0         " Get rid of modelines for security or something
"set clipboard=unnamedplus "Copy to system clipboard by default


" -------------------------------------
" Text editing
" -------------------------------------
set spell               " Turn spellcheck on
set spelllang=en        " Set spelling to English


" -------------------------------------
" Search and destro--er, replace
" -------------------------------------
set gdefault            " Global search and replace by default
set ignorecase          " Ignore case when searching...
set smartcase           " ...Except when search pattern contains an uppercase char
set hls                 " Highlight search items


" -------------------------------------
" Change vim colorz
" -------------------------------------
if (&t_Co == 256 || &t_Co == 88) && !has('gui_running') &&
  \ filereadable(expand("$HOME/.vim/plugin/guicolorscheme.vim"))
  " Use the guicolorscheme plugin to makes 256-color or 88-color
  " terminal use GUI colors rather than cterm colors.
  runtime! plugin/guicolorscheme.vim
  GuiColorScheme molokai
else
  " For 8-color 16-color terminals or for gvim, just use the
  " regular :colorscheme command.
  colorscheme molokai
endif


" -------------------------------------
" External programs
" -------------------------------------
" Convert markdown to HTML
nmap <leader>md :%!/usr/bin/markdown_py<CR>


" -------------------------------------
" Auto-completion
" -------------------------------------
autocmd FileType html set omnifunc=htmlcomplete#Complete
let g:pydiction_location = '/usr/share/pydiction/complete-dict'

