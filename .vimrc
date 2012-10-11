" ## MODELINE & NOTES {
" Fold sections by default
" vim: set foldmarker={,} foldlevel=0 foldmethod=marker spell:
"
"
" Nathan Houle's ~.vimrc 
" Any genius contained within shamelessly stolen from smarter folks
"
" }
" ## INITIAL SETUP ## {
    " Don't load this file when using evim
    if v:progname =~? "evim"
        finish
    endif
    " Disable pesky ex mode
    nnoremap Q <ESC>
    " Prevent F1 from toggling Vim's help menu
    nnoremap <F1> <ESC>
    inoremap <F1> <ESC>
    vnoremap <F1> <ESC>
" }
" ## BUNDLES/PLUGINS ## {
    " Use local bundles if available
    if filereadable(expand("~/.vimrc.bundles")) 
        source ~/.vimrc.bundles
    endif
" }
" ## GENERAL SETTINGS ## {
    set encoding=utf-8      " Use UTF-8 encoding by default
    set scrolloff=5         " Start scrolling five lines from the bottom
    set showmode            " Display the mode we're in (visual, insert, etc.)
    set showcmd             " Show last executed command, visual selections
    set ruler               " Always show the cursor position
    set history=100         " Give vim a long memory
    set undolevels=1000     " Keep all the undos
    set title               " Change the terminal window's title
    set nobackup            " Backups go down the hole
    set noswapfile          " Swap files go down the hole
    set autowrite           " Make sure your data doesn't go down the hole
    set wildmenu            " Better buffer switching menu
    set clipboard=unnamedplus "Copy to system clipboard by default
" }
" ## TEXT DISPLAY AND FORMATTING ## {
    syntax on               " Turn syntax highlighting on
    set relativenumber      " Set line numbering relative to current line
    set colorcolumn=85      " Show a column at 85 to show max width
    set tabstop=4           " Set tab width to four spaces
    set softtabstop=4       " Make tabs easier to delete
    set shiftwidth=4        " Auto-indent this many spaces
    set expandtab           " Turn <Tab> into spaces indicated in tabstop
    set relativenumber      " Set line numbering relative to current line
" }
" ## PLAINTEXT EDITING ## {
    set spell               " Turn spellcheck on
    set spelllang=en        " Set spelling to English
    au FileType text setlocal textwidth=84 " Keep text files from getting too wide
" }
" ## SEARCHING ## {
    set gdefault            " Global search and replace by default
    set ignorecase          " Ignore case when searching...
    set smartcase           " ...Except when search contains an uppercase char
    set hlsearch            " Highlight search items
    set incsearch           " Highlight search results as you type
" }
" ## AUTOCOMPLETION ## {
    " Enable the Pydiction auto-completion library
    let g:pydiction_location = '$HOME/.vim/bundle/Pydiction/complete-dict'
" }
" ## COLOR SCHEME ## {
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
" }
" ## EXTERNAL PROGRAMS ## {
    " Convert markdown to HTML
    nmap <leader>md :%!/usr/bin/markdown_py<CR>
" }
" ## KEYBINDINGS ## {
    " Change leader key from \ to ,
    let mapleader=","
    " Activate : using ;
    nnoremap ; :

    " Move down by displayed lines, not actual lines
    nnoremap j gj
    nnoremap k gk

    " Remap Q to reformat paragraph text
    vmap Q gq
    nmap Q gqap

    " Toggle between regular numbering, relative numbering, no numbering
    nmap <silent> <F1> :exec &nu==&rnu? "se nu!" : "se rnu!"<CR>
    " Enable paste mode--helps quash indent, etc. when pasting large blocks of code
    nnoremap <F2> :set invpaste paste?<CR>
    " Clear any highlighting on search terms
    nmap <silent> <F3> :set hlsearch!<CR>

    " Make writing files via sudo easier
    cmap w!! w !sudo tee % >/dev/null
" }
