" ## MODELINE & NOTES ## {
    " Fold sections by default
    " vim: set foldmarker={,"} foldlevel=0 foldmethod=marker spell:
    "
    "
    " Nathan Houle's ~.vimrc
    " Any genius contained within shamelessly stolen from smarter folks
    "
"}
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
"}
" ## BUNDLES/PLUGINS ## {
    " Use local bundles if available
    if filereadable(expand("~/.vimrc.bundles"))
        source ~/.vimrc.bundles
    endif

    " Show Powerline, use fancy symbols
    set laststatus=2
    let g:Powerline_symbols = 'fancy'

    " When writing a file, let Syntastic mark errors if they exist
    let g:syntastic_enable_signs=1
    let g:syntastic_auto_loc_list=1
"}
" ## GENERAL SETTINGS ## {
    set encoding=utf-8      " Use UTF-8 encoding by default
    set scrolloff=5         " Start scrolling five lines from the bottom
    set history=100         " Give vim a long memory
    set undolevels=1000     " Keep all the undos
    set title               " Change the terminal window's title
    set showcmd             " Show inc commands in status line as they're being typed
    set nobackup            " Backups go down the hole
    set noswapfile          " Swap files go down the hole
    set autowrite           " Autosave on make or shell commands
    set wildmenu            " Better buffer switching menu
"}
" ## TEXT DISPLAY AND FORMATTING ## {
    syntax on               " Turn syntax highlighting on
    set relativenumber      " Set line numbering relative to current line
    set colorcolumn=85      " Show a column at 85 to show max width
    set tabstop=4           " Set tab width to four spaces
    set softtabstop=4       " Make tabs easier to delete
    set shiftwidth=4        " Auto-indent this many spaces
    set expandtab           " Turn <Tab> into spaces indicated in tabstop
    set relativenumber      " Set line numbering relative to current line
"}
" ## PLAINTEXT EDITING ## {
    set spell               " Turn spellcheck on
    set spelllang=en        " Set spelling to English
    au FileType text,markdown setlocal textwidth=84 " Keep text files from getting too wide
"}
" ## FILETYPE-SPECIFIC SETTINGS ## {
    au FileType javascript,css setlocal ts=2 sts=2 sw=2
    au FileType xhtml,html,htm,php,xml setlocal noexpandtab ts=2 sts=2 sw=2

    " Enable syntax highlighting for jquery files
    au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
"}
" ## WHITESPACE DETECTOR ## {
    " Highlight trailing whitespace, don't highlight while typing
    autocmd ColorScheme * highlight ExtraWhitespace ctermbg=DarkRed guibg=DarkRed
    au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
    au InsertLeave * match ExtraWhitespace /\s\+$/
"}
" ## SEARCHING ## {
    set ignorecase          " Ignore case when searching...
    set smartcase           " ...Except when search contains an uppercase char
    set hlsearch            " Highlight search items
    set incsearch           " Highlight search results as you type
"}
" ## AUTOCOMPLETION ## {
    " Enable the Pydiction auto-completion library
    " let g:pydiction_location = '$HOME/.vim/bundle/Pydiction/complete-dict'
"}
" ## COLOR SCHEME ## {
    set background=dark

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
"}
" ## EXTERNAL PROGRAMS ## {
    " Convert markdown to HTML
    nmap <leader>md :%!/usr/bin/markdown_py<CR>
"}
" ## KEYBINDINGS ## {
    " Change leader key from \ to ,
    let mapleader=","

    " Activate : using ;
    nnoremap ; :

    " Map leader to pane switching for great victory
    nnoremap <leader>w <C-w>w

    nnoremap <leader>] zfi}      " Fold within curly braces

    " Move down by displayed lines, not actual lines
    nnoremap j gj
    nnoremap k gk

    " Remap Q to reformat paragraph text
    vmap Q gq
    nmap Q gqap

    " Copy to system clipboard
    map <leader>y "+yy
    " Paste from system clipboard
    map <leader>p "+p

    " Make writing files via sudo easier
    cmap w!! w !sudo tee % >/dev/null

    " Launch nerdtree plugin
    noremap <silent> <leader>n :NERDTreeToggle<CR>

    " Launch CtrlP plugin
    map <leader>t :CtrlP<CR>

    " Toggle between regular numbering, relative numbering, no numbering
    nmap <silent> <F2> :exec &nu==&rnu? "se nu!" : "se rnu!"<CR>

    " Enable paste mode--helps quash indent, etc. when pasting large blocks of code
    nnoremap <F3> :set invpaste paste?<CR>

    " Toggle spell check
    nnoremap <F4> :set spell!<CR>

    " Clear any highlighting on search terms
    nmap <silent> <F5> :set hlsearch!<CR>

    " Strip trailing whitespace from all lines
    nmap <silent> <F11> :%s/\s\+$<CR>

    " Open the yank ring
    nnoremap <silent> <F12> :YRShow<CR>
"}
