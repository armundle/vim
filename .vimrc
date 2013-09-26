set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin


"setting the font
set guifont=Consolas:h12

"hiding the toolbar
:set guioptions-=T  "remove toolbar

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugin
filetype plugin on
filetype indent on


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the curors - when moving vertical..
set so=7

set wildmenu "Turn on WiLd menu

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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable "Enable syntax hl
syntax on

"set background=dark
if has("gui_running")
  set guioptions-=T
  set t_Co=256
  colorscheme molokai
  set nonu
else
  set t_Co=256
  colorscheme molokai
  set nonu
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set shiftwidth=3
set tabstop=3
set smarttab

set autoindent
set cindent

set lbr
set tw=500

set ai "Auto indent
set si "Smart indet
set wrap "Wrap lines

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket expanding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>

" Map auto complete of (, ", ', [
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $q ''<esc>i
inoremap $e ""<esc>i
inoremap $t <><esc>i

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"line numbers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:set number
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Taglist
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin on
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Brackets autocompletion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:inoremap ( ()<Esc>i
:inoremap { {}<Esc>i
:inoremap [ []<Esc>i


""""""""""""""""""""""""""""""
" => Statusline
""""""""""""""""""""""""""""""
" Always hide the statusline
"set laststatus=2

" Format the statusline
set showcmd              " Show (partial) command in status line.
set showmode    "show current mode down the bottom
set statusline=%f       "tail of the filename
set statusline+=%h      "help file flag
set statusline+=%y      "filetype
set statusline+=%r      "read only flag
set statusline+=%m      "modified flag
set statusline+=%=      "left/right separator
set statusline+=%{StatuslineCurrentHighlight()}\ \ "current highlight
set statusline+=%c:     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file
set laststatus=2
set statusline+=%{FileTime()} "filemodified

function! FileTime()
  let ext=tolower(expand("%:e"))
  let fname=tolower(expand('%<'))
  let filename=fname . '.' . ext
  let msg=""
  let msg=msg." ".strftime("<mod:%b,%d'%y|%H:%M:%S>",getftime(filename))
  return msg
endfunction

"return the syntax highlight group under the cursor ''
function! StatuslineCurrentHighlight()
    let name = synIDattr(synID(line('.'),col('.'),1),'name')
    if name == ''
        return ''
    else
        return '[' . name . ']'
    endif
endfunction

"Show key
set showcmd

"""""""""""""""""""""""""""""""
" Set cwd to current file
"""""""""""""""""""""""""""""""
set autochdir

"""""""""""""""""""""""""""""""
" Colorize Parenthesis
"""""""""""""""""""""""""""""""
"let loaded_matchparen = 1

"""""""""""""""""""""""""""""""
" Colorize Matching Parenthesis
"""""""""""""""""""""""""""""""
hi MatchParen guibg=yellow guifg=black

"""""""""""""""""""""""""""""""
" Ctags search in above folder
""""""""""""""""""""""""""""""
:set tags=./tags,./../tags,./../../tags,./../../../tags,tags

"""""""""""""""""""""""""""""""
" Ctags update with ,t
""""""""""""""""""""""""""""""
nmap ,t :!(cd %:p:h;ctags *)&

map <C-F8> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
"C-\ - Open the definition in a new tab
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

"A-] - Open the definition in a vertical split
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

map <C-}> :tnext <CR>

"""""""""""""""""""""""""""""""
" Tagbar
"""""""""""""""""""""""""""""""
nmap <F8> :TagbarToggle<CR>

"""""""""""""""""""""""""""""""
"gvimfullscreen_win32 : Put gvim in full screen on Windows 
"""""""""""""""""""""""""""""""
map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>

"""""""""""""""""""""""""""""""
"Mapping for NERDTree
"""""""""""""""""""""""""""""""
nmap <F6> :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""
"Remove menu bar
"""""""""""""""""""""""""""""""
:set guioptions-=m  "remove menu bar

"""""""""""""""""""""""""""""""
"Remove toolbars
"""""""""""""""""""""""""""""""
set guioptions+=LlRrb
set guioptions-=LlRrb

"""""""""""""""""""""""""""""""
"Toggle display of menu bar
"""""""""""""""""""""""""""""""
nnoremap <C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>

"""""""""""""""""""""""""""""""
" Highlight colors for functions and classes
" Addtion from Eduaro@StackOverFlow
" Highlight Class and Function names
"""""""""""""""""""""""""""""""
syn match    cCustomParen    "(" contains=cParen contains=cCppParen
syn match    cCustomFunc     "\w\+\s*(" contains=cCustomParen
syn match    cCustomScope    "::"
syn match    cCustomClass    "\w\+\s*::" contains=cCustomScope
hi def link cCustomFunc  Function
hi def link cCustomClass Function

hi def cCustomFunc  guifg=#FAFFA7
hi def cCustomClass guifg=#FFDBC4

"""""""""""""""""""""""""""""""
"Highlight current line
"""""""""""""""""""""""""""""""
set cursorline
hi CursorLine  guibg=black

"""""""""""""""""""""""""""""""
"Highlight search
"""""""""""""""""""""""""""""""
hi search guifg=black guibg=yellow gui=bold


"""""""""""""""""""""""""""""""
"OmniComplete
"""""""""""""""""""""""""""""""
set tags+=~/.vim/commontags

" --- OmniCppComplete ---
" -- required --
set nocp " non vi compatible mode
filetype plugin on " enable plugins
 
" -- optional --
" auto close options when exiting insert mode or moving away
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
set completeopt=menu,menuone
 
" -- configs --
let OmniCpp_MayCompleteDot = 1 " autocomplete with .
let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)
let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included files
let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype (i.e. parameters) in popup window
let OmniCpp_LocalSearchDecl = 1 " don't require special style of function opening braces


"""""""""""""""""""""""""""""""
" Setup the tab key to do autocompletion
"""""""""""""""""""""""""""""""
function! CompleteTab()
  let prec = strpart( getline('.'), 0, col('.')-1 )
  if prec =~ '^\s*$' || prec =~ '\s$'
    return "\<tab>"
  else
    return "\<c-x>\<c-o>"
  endif
endfunction

"""""""""""""""""""""""""""""""
" Easier split navigation                                                                                                                               
"""""""""""""""""""""""""""""""
" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>                                                                                                                       
nmap <silent> <c-j> :wincmd j<CR>                                                                                                                       
nmap <silent> <c-h> :wincmd h<CR>                                                                                                                       
nmap <silent> <c-l> :wincmd l<CR>

"""""""""""""""""""""""""""""""
"Highlight diff changes
"""""""""""""""""""""""""""""""
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
          \ | wincmd p | diffthis
endif
nmap <F12> :DiffOrig<CR>

"""""""""""""""""""""""""""""""
"Mapping for scratchpad
"""""""""""""""""""""""""""""""
nmap <leader>s :Sscratch<CR>

"""""""""""""""""""""""""""""""
"Hihglight column=80
"""""""""""""""""""""""""""""""
set textwidth=80
set cc=80
hi ColorColumn guibg=#424242

"""""""""""""""""""""""""""""""
"Paste toggle
"""""""""""""""""""""""""""""""
set pastetoggle=<F2>

"""""""""""""""""""""""""""""""
"Add pathogen
"""""""""""""""""""""""""""""""
call pathogen#infect()

"""""""""""""""""""""""""""""""
"Nubmers toggle
"""""""""""""""""""""""""""""""
nnoremap <leader>n :NumbersToggle<CR>

"""""""""""""""""""""""""""""""
" Automatically resize vertical splits.
"""""""""""""""""""""""""""""""
:au WinEnter * :set winfixheight
:au WinEnter * :wincmd =
"
"""""""""""""""""""""""""""""""
" Backup dir
"""""""""""""""""""""""""""""""
set backupdir=/Users/armundle/.vim/backup
