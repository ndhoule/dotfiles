"
" Nathan Houle's ~.vimrc 
"
" I lay claim to no genius contained within; many of these are stolen from or
" inspired by innumerable blog posts, SO threads, the Vim book I'm editing, etc.
"

" Bundles {
    " Use local bundles if available
    if filereadable(expand("~/.vimrc.bundles"))
        source ~/.vimrc.bundles
    endif
" }



" -------------------------------------
" General settings
" -------------------------------------
set encoding=utf-8      " Use UTF-8 encoding by default
set scrolloff=5         " Start scrolling five lines from the bottom
set showmode            " Display the mode we're in (visual, insert, etc.)
set showcmd             " Show last executed command, visual selections
set modelines=0         " Disable modelines for security's sake
set history=1000        " Give vim a long memory
set undolevels=1000     " Keep all the undos
set title               " Change the terminal window's title
set nobackup            " Turn off backups (use version control)
set noswapfile          " Turn off swap file (it's annoying)
"set clipboard=unnamedplus "Copy to system clipboard by default


" -------------------------------------
" Text format and display
" -------------------------------------
syntax on               " Turn syntax highlighting on
set relativenumber      " Set line numbering relative to current line
set colorcolumn=85      " Show a column at 85 to show max width
set tabstop=4           " Set tab width to four spaces
set softtabstop=4       " Make tabs easier to delete
set shiftwidth=4        " Auto-indent this many spaces
set expandtab           " Turn <Tab> into spaces indicated in tabstop
set relativenumber      " Set line numbering relative to current line


" -------------------------------------
" Text editing
" -------------------------------------
set spell               " Turn spellcheck on
set spelllang=en        " Set spelling to English


" -------------------------------------
" Search and replace
" -------------------------------------
set gdefault            " Global search and replace by default
set ignorecase          " Ignore case when searching...
set smartcase           " ...Except when search pattern contains an uppercase char
set hlsearch            " Highlight search items
set incsearch           " Highlight search results as you type


" -------------------------------------
" Auto-completion
" -------------------------------------
" Enable the Pydiction auto-completion library
" let g:pydiction_location = '$HOME/.vim/bundle/Pydiction/complete-dict'


" -------------------------------------
" Color theme
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
" Key bindings
" -------------------------------------
" Jump to next row
nnoremap j gj
nnoremap k gk

" Prevent F1 from toggling Vim's help menu
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Change leader key from \ to ,
let mapleader=","

" Activate : using ;
nnoremap ; :

" Make writing file via sudo easier
cmap w!! w !sudo tee % >/dev/null

" Toggle between regular numbering, relative numbering, no numbering
nmap <silent> <F2> :exec &nu==&rnu? "se nu!" : "se rnu!"<CR>
" Enable paste mode--helps quash indent, etc. when pasting large blocks of code
nnoremap <F3> :set invpaste paste?<CR>
set pastetoggle=<F2>
" Clear any highlighting on search terms
nmap <silent> <F4> :set hlsearch!<CR>

