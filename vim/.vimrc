" -------------------------------------
" Key bindings
" -------------------------------------
"Navigate with jkl; instead of hjkl. Yeah, I'm a wuss.
noremap ; l
noremap l k
noremap k j
noremap j h

" Convert markdown to HTML by typing :md
nmap :md :%!/usr/bin/markdown_py<cr>




" -------------------------------------
" Text format and display
" -------------------------------------
"set textwidth=78  " Set max line length to 78 before wrap
set wrap          " Display text wrapped if it's too long to display

set smartindent   " Enable autoindent
set expandtab     " <Tab> key gets turned into spaces indicated in tabstop
set tabstop=4     " Set tab width to four spaces
set softtabstop=4 " Make tabs easier to delete
set shiftwidth=4  " Autoindent indents this many spaces

set number        " Turn on line numbering and a hotkey to hide it
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>




" -------------------------------------
" Syntax highlighting
" -------------------------------------
syntax on          " Turn syntax highlighting on




" -------------------------------------
" Miscellaneous
" -------------------------------------
"set modeline
"set modelines=5
"set spell          " Set spellcheck
set spelllang=en   " Set spelling to English
set hls            " Highlight search
set ignorecase     " Ignore case when searching...
set smartcase      " ...Except when search pattern contains an uppercase char
colorscheme desert " Use desert for console vim theme. More pleasant than default!




" -------------------------------------
" External programs
" -------------------------------------
" Convert markdown to HTML by typing :md
nmap :md :%!/usr/bin/markdown_py<cr>
