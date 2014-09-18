"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin dependency
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocompletepop
" fuzzyfinder
" l9
" nerdcommenter
" nerdtree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"setting the font
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8
set guifont=Consolas:h10
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"hiding the toolbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:set guioptions-=T  "remove toolbar
""""""""""""""""""""""""""""""
"Rmove menu bar
""""""""""""""""""""""""""""""
:set guioptions-=m  "remove menu bar
""""""""""""""""""""""""""""""
"Remove toolbars
""""""""""""""""""""""""""""""
set guioptions+=LlRrb
set guioptions-=LlRrb
""""""""""""""""""""""""""""""
"Toggle display of menu bar
""""""""""""""""""""""""""""""
nnoremap <C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
nnoremap <S-F1> :if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=100
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable filetype plugin
" Currently enabled by pathogen
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"filetype plugin on
"filetype indent on
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the curors - when moving vertical
set so=7
set ruler "Always show current position
set cmdheight=2 "The commandbar height
set hid "Change buffer - without saving

" Set backspace config
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set ignorecase "Ignore case when searching
set smartcase

set hlsearch "Highlight search things

set incsearch "Make search act like search in modern browsers
set nolazyredraw "Don't redraw while executing macros 

set magic "Set magic on, for regular expressions

set showmatch "Show matching bracets when text indicator is over them

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
""""""""""""""""""""""""""""""
"Highlight current line
""""""""""""""""""""""""""""""
set cursorline
hi CursorLine  guibg=black
""""""""""""""""""""""""""""""
"Highlight search
""""""""""""""""""""""""""""""
hi search guifg=black guibg=yellow gui=bold
""""""""""""""""""""""""""""""
" Easier split navigation
""""""""""""""""""""""""""""""
" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>
""""""""""""""""""""""""""""""
"Mapping for scratchpad
""""""""""""""""""""""""""""""
nmap <leader>s :Sscratch<CR>
""""""""""""""""""""""""""""""
"Hihglight column=80
""""""""""""""""""""""""""""""
set wrap
set textwidth=80
set cc=80
hi ColorColumn guibg=#3D3D3D

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable "Enable syntax hl
colorscheme molokai
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set shiftwidth=4
set tabstop=4
set smarttab
set wrap

set autoindent
set cindent

set lbr
set tw=80

"set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"line numbers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:set number
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Brackets autocompletion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:inoremap ( ()<Esc>i
:inoremap { {}<Esc>i
:inoremap [ []<Esc>i
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"startup dir
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"cd C:\Users\amundle
"cd P:
""""""""""""""""""""""""""""""
" Statusline
""""""""""""""""""""""""""""""
set laststatus=2
"""""""""""""""""""""""""""""""
" Set cwd to current file
"""""""""""""""""""""""""""""""
set autochdir
"""""""""""""""""""""""""""""""
" Colorize Matching Parenthesis
"""""""""""""""""""""""""""""""
hi MatchParen guibg=green guifg=black
"""""""""""""""""""""""""""""""
" Ctags search in above folder
""""""""""""""""""""""""""""""
:set tags=./tags,./../tags,./../../tags,./../../../tags,tags
"""""""""""""""""""""""""""""""
" Ctags update with ,t
""""""""""""""""""""""""""""""
nmap ,t :!(cd %:p:h;ctags *)&

map <C-F8> :!ctags -R --c++-kinds=+pl --fields=+iaS --extra=+q .<CR>
"C-\ - Open the definition in a new tab
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
"A-] - Open the definition in a vertical split
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

map <C-}> :tnext <CR>

map <leader>t :tn<CR>
""""""""""""""""""""""""""""""
" Tagbar
""""""""""""""""""""""""""""""
nmap <F8> :TagbarToggle<CR>
""""""""""""""""""""""""""""""
"gvimfullscreen_win32 : Put gvim in full screen on Windows 
map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
""""""""""""""""""""""""""""""
"Mapping for NERDTree
""""""""""""""""""""""""""""""
set autochdir
let NERDTreeChDirMode=2
nnoremap <leader>n :NERDTreeToggle .<CR>
""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
" Enable buffer search with FufBuffer
""""""""""""""""""""""""""""""
nmap <leader>f :FufBuffer<CR>
""""""""""""""""""""""""""""""
" Store swap and temp files in backup directory
""""""""""""""""""""""""""""""
set backupdir=~/vimtmp,.
set directory=~/vimtmp,.
""""""""""""""""""""""""""""""
"Search the word under cursor recursively in current dir
""""""""""""""""""""""""""""""
map <C-F4> :noautocmd execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
""""""""""""""""""""""""""""""
"Type dts in insert mode to expand to a datestamp
""""""""""""""""""""""""""""""
:iab <expr> dts strftime("%c")
""""""""""""""""""""""""""""""
"Pathogen
""""""""""""""""""""""""""""""
execute pathogen#infect()
syntax on
filetype plugin indent on
""""""""""""""""""""""""""""""
"Tagbar
""""""""""""""""""""""""""""""
let g:tagbar_usearrows = 1
""""""""""""""""""""""""""""""
"Selection color
""""""""""""""""""""""""""""""
hi Visual  guifg=#000000 guibg=#FFFFFF gui=none
""""""""""""""""""""""""""""""
"Open explorer window
""""""""""""""""""""""""""""""
map <C-e> :silent !explorer %:p:h:gs?\/?\\\\\\?<CR>
""""""""""""""""""""""""""""""
"Markdown syntax highlight for md, mkd and Markdown files
""""""""""""""""""""""""""""""
au BufRead,BufNewFile *.md set filetype=markdown

""""""""""""""""""""""""""""""
" Show tab, whitespace, eol as special characters
""""""""""""""""""""""""""""""
:set list
:set listchars=eol:¬,tab:>-,trail:·,extends:>,precedes:<
""""""""""""""""""""""""""""""
" Language specific modification
""""""""""""""""""""""""""""""
" C/C++
""""""""""""""""""""""""""""""
" Highlight colors for functions and classes
" Addtion from Eduaro@StackOverFlow
" Highlight Class and Function names
""""""""""""""""""""""""""""""
syn match    cCustomParen    "(" contains=cParen contains=cCppParen
syn match    cCustomFunc     "\w\+\s*(" contains=cCustomParen
syn match    cCustomScope    "::"
syn match    cCustomClass    "\w\+\s*::" contains=cCustomScope
hi def link cCustomFunc  Function
hi def link cCustomClass Function

hi def cCustomFunc  guifg=#FAFFA7
hi def cCustomClass guifg=#FFDBC4
nmap <A-t> :tabnew<CR>
""""""""""""""""""""""""""""""
