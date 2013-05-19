" ## Modeline & Notes ## {{
    " Fold sections by default
    " vim: set foldmarker={{,"}} foldlevel=0 foldmethod=marker spell:
    "
    "
    " Nathan Houle's ~.vimrc
    " Any genius contained within shamelessly stolen from smarter folks
    "
"}}
" ## Initial Setup ## {{
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

    " Disable tmux status line when entering vim
    "autocmd VimEnter,VimLeave * silent !tmux set status
"}}
" ## Bundles and Plugin Setup ## {{
    " Pathogen, go!
    execute pathogen#infect()
    syntax on
    filetype plugin indent on

    " Powerline, go!
    " See https://github.com/Lokaltog/powerline/issues/39 and
    " https://coderwall.com/p/dmhp5q for installation tips
    source /Library/Python/2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim

    " Set VimClojure settings
    let g:vimclojure#HighlightBuiltins = 1
    let g:vimclojure#ParenRainbow = 1

    " Change snippets directory
    let g:snips_trigger_key = '<C-\>'

    " Enable YankRing and move its storage file
    let g:yankring_enabled = 1
    let g:yankring_history_dir = '$VIM'
    let g:yankring_history_file = 'yankring_history'

    " Show Powerline by default
    set laststatus=2
    let g:Powerline_symbols = 'fancy'

    " Let Syntastic lint files on save and show location markers, pane
    let g:syntastic_enable_signs=1
    let g:syntastic_auto_loc_list=1

    " Map ragtag
    inoremap <M-o>       <Esc>o
    inoremap <C-j>       <Down>
    let g:ragtag_global_maps = 1

    " Disable default multicursor hotkeys (we remap them later)
    let g:multi_cursor_use_default_mapping=0

    " CtrlP Options
    set wildignore+=*/tmp/*,*.so,*.swp,*.zip,.git,.DS_Store*,*~,*.un~,\#*\#,.emacs.desktop*
"}}
" ## General Settings ## {{
    set encoding=utf-8       " Use UTF-8 encoding by default
    set scrolloff=5          " Start scrolling five lines from the bottom
    set history=100          " Give vim a long memory
    set undolevels=1000      " Keep all the undos
    set title                " Change the terminal window's title
    set showcmd              " Show inc commands in status line as they're being typed
    set noswapfile           " Swap files go down the hole
    set autowrite            " Autosave on make or shell commands
    set wildmenu             " Better buffer switching menu

    " Save backups to a less annoying place than the current directory.
    " If you have .vim-backup in the current directory, it'll use that.
    " Otherwise it saves it to ~/.vim/backup or . if all else fails.
    if isdirectory($HOME . '/.vim/backup') == 0
      :silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
    endif
    set backupdir-=.
    set backupdir+=.
    set backupdir-=~/
    set backupdir^=~/.vim/backup/
    set backupdir^=./.vim-backup/
    set backup

    " viminfo stores the state of your previous editing session
    set viminfo+=n~/.vim/viminfo

    if exists("+undofile")
      " undofile - This allows you to use undos after exiting and restarting
      if isdirectory($HOME . '/.vim/undo') == 0
        :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
      endif
      set undodir=./.vim-undo//
      set undodir+=~/.vim/undo//
      set undofile
    endif
"}}
" ## Text Display and Formatting ## {{
    set cursorline           " Highlight the current line
    set cursorcolumn         " Highlight the current column
    syntax on                " Turn syntax highlighting on
    set relativenumber       " Set line numbering relative to current line
    set colorcolumn=80       " Show a column at 80 to show max width
    set textwidth=80         " Keep text files from getting too wide
    set tabstop=2            " Set tab width to four spaces
    set softtabstop=2        " Make tabs easier to delete
    set shiftwidth=2         " Auto-indent this many spaces
    set expandtab            " Turn <Tab> into spaces indicated in tabstop
    set list listchars=tab:→\ ,trail:·
"}}
" ## Plaintext Editing ## {{
    set spelllang=en         " Set spelling to English
"}}
" ## Filetype-Specific Settings ## {{
    au FileType python setlocal ts=4 sts=4 sw=4

    " Allow HTML files to run longer than 80 characters wide
    au FileType html setlocal textwidth=0 wrapmargin=0

    au BufRead,BufNewFile *.html set ft=handlebars
    au BufRead,BufNewFile *.lessimport set ft=less

    " Enable syntax highlighting for jquery files
    au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

    " Set puppet files to ruby syntax
    au BufNewFile,BufRead *.pp set filetype=ruby
"}}
" ## Trailing Whitespace Highlighter ## {{
    " Highlight trailing whitespace after leaving insert mode
    autocmd ColorScheme * highlight ExtraWhitespace ctermbg=DarkRed guibg=DarkRed
    au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
    au InsertLeave * match ExtraWhitespace /\s\+$/
"}}
" ## Searching ## {{
    set ignorecase           " Ignore case when searching...
    set smartcase            " ...Except when search contains an uppercase char
    set hlsearch             " Highlight search items
"}}
" ## Autocompletion ## {{
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"}}
" ## Color Scheme ## {{
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
"}}
" ## Keybindings ## {{
    let mapleader=","        " Change leader key from \ to ,

    " Activate : using ;
    nnoremap ; :

    " Git mappings
    nnoremap <leader>gw :Gwrite<CR>
    nnoremap <leader>gc :Gcommit<CR>
    nnoremap <leader>gst :Gstatus<CR>
    nnoremap <leader>gd :Gdiff<CR>
    nnoremap <leader>gd :Gdiff<CR>
    nnoremap <leader>gb :Gbrowse<CR>

    " Easy JavaScript mode
    nnoremap <leader>js :set ft=javascript<CR>

    " Remap tcomment to use leader key rather than g
    let g:tcommentMapLeaderOp1="<leader>"

    " Remap Dash lookup
    nnoremap <leader>h :Dash

    " Map multicursor hotkeys
    let g:multi_cursor_next_key="\<C-n>"
    let g:multi_cursor_prev_key="\<C-b>"
    let g:multi_cursor_skip_key="\<C-x>"
    let g:multi_cursor_exit_key="\<Esc>"

    " Map leader to pane switching for great victory
    nnoremap <leader>w <C-w>w

    " Shortcuts for splitting
    nnoremap <leader>vs :vsplit<CR>
    nnoremap <leader>hs :split<CR>

    " Fold within curly braces
    nnoremap <leader>} zfi}

    " Move down by displayed lines, not actual lines
    nnoremap j gj
    nnoremap k gk

    " Remap Ctrl-Bksp to delete the last word
    imap <C-BS> <C-W>

    " Remap Q to reformat paragraph text
    vmap Q gq
    nmap Q gqap

    " Copy to system clipboard
    map <leader>y "+yy
    " Paste from system clipboard
    map <leader>p "+p

    " Make writing files via sudo easier
    cmap w!! w !sudo tee % >/dev/null

    " Launch nerdtree
    noremap <silent> <leader>n :NERDTreeToggle<CR>

    " Launch CtrlP
    let g:ctrlp_map = '<leader>t'

    nmap <silent> <leader>ch :set hlsearch!<CR> " Clear any highlighting on search terms

    " Toggle rainbow parens (defaults to parens only)
    function! Rainbows()
      :RainbowParenthesesToggle
      :RainbowParenthesesLoadRound
    endfunction

    nnoremap <silent> <leader>r :call Rainbows()<CR>

    function! PresentationMode()
       if g:colors_name != "default"
         colorscheme default
         set bg=light
         set nolist
         set nocursorline
         set nocursorcolumn
       else
         set background=dark
         colorscheme molokai
         set cursorline
         set cursorcolumn
       endif
    endfunction

    " Enter/exit presentation mode
    nnoremap <silent> <leader>pm :call PresentationMode()<CR>

    " Open a scratch file
    nnoremap <silent> <leader>s :Scratch<CR>

    " Toggle between regular numbering, relative numbering, no numbering
    nmap <silent> <F2> :exec &nu==&rnu? "se nu!" : "se rnu!"<CR>

    " Enable paste mode--helps quash indent, etc. when pasting large blocks of code
    nnoremap <F3> :set invpaste paste?<CR>

    " Toggle spell check
    nnoremap <F4> :set spell!<CR>

    " Strip trailing whitespace from all lines
    nmap <silent> <F11> :%s/\s\+$<CR>

    " Open the yank ring
    nnoremap <silent> <F12> :YRShow<CR>

    " Slimux commands - Send stuff to a REPL for great virtousness
    map <leader>sl :SlimuxREPLSendLine<CR>
    map <leader>sp :SlimuxShellPrompt<CR>
    map <leader>sla :SlimuxShellLast<CR>
    map <leader>ss :SlimuxREPLSendSelection<CR>
    map <leader>ssc :SlimuxShellConfigure<CR>
    map <leader>src :SlimuxREPLConfigure<CR>
"}}
