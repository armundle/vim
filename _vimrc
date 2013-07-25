set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

"setting the font
set encoding=utf-8
set guifont=Consolas:h10

"hiding the toolbar
:set guioptions-=T  "remove toolbar

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=100

" Enable filetype plugin
filetype plugin on
filetype indent on


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the curors - when moving vertical..
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable "Enable syntax hl

"colorscheme zenburn
"colorscheme ir_black

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

"set wildmode=list:longest   "make cmdline tab completion similar to bash
"set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
"set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing

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

colorscheme molokai

"autocmd FileType txt colorscheme solarized
"autocmd BufEnter,BufNewFile *.txt colorscheme solarized

cd C:\Users\amundle

""""""""""""""""""""""""""""""
" => Statusline
""""""""""""""""""""""""""""""
set laststatus=2
"""""""""""""""""""""""""""""""
" Set cwd to current file
"""""""""""""""""""""""""""""""
set autochdir

"""""""""""""""""""""""""""""""
" Colorize Parenthesis
"""""""""""""""""""""""""""""""
let loaded_matchparen = 1
"
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
"nmap ,t :!(cd %:p:h;ctags *)&

"map <C-F8> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
"C-\ - Open the definition in a new tab
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

"A-] - Open the definition in a vertical split
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

map <C-}> :tnext <CR>



" Tagbar
nmap <F8> :TagbarToggle<CR>

"gvimfullscreen_win32 : Put gvim in full screen on Windows 
map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>

"Mapping for NERDTree
nmap <F6> :NERDTreeToggle<CR>

"Rmove menu bar
:set guioptions-=m  "remove menu bar

"Remove toolbars
set guioptions+=LlRrb
set guioptions-=LlRrb

"Toggle display of menu bar
nnoremap <C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
"nnoremap <S-F1> :if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>
"
" Highlight colors for functions and classes
" Addtion from Eduaro@StackOverFlow
" Highlight Class and Function names
syn match    cCustomParen    "(" contains=cParen contains=cCppParen
syn match    cCustomFunc     "\w\+\s*(" contains=cCustomParen
syn match    cCustomScope    "::"
syn match    cCustomClass    "\w\+\s*::" contains=cCustomScope
hi def link cCustomFunc  Function
hi def link cCustomClass Function

hi def cCustomFunc  guifg=#FAFFA7
hi def cCustomClass guifg=#FFDBC4

"Highlihgt current line
set cursorline
hi CursorLine  guibg=black

"Highlight search
hi search guifg=black guibg=yellow gui=bold


" Display the modification time on status bar
"set statusline=%<%f%<%{FileTime()}%<%h%m%r%=%-20.(line=%03l,col=%02c%V,totlin=%L%)\%h%m%r%=%-30(,BfNm=%n%Y%)\%P\*%=%{}
"set rulerformat=%15(%c%V\ %p%%%)
"set rulerformat=%<%f%<%{FileTime()}%<%h%m%r%=%-20.(line=%03l,col=%02c%V,totlin=%L%)\%h%m%r%=%-30(,BfNm=%n%Y%)\%P\*%=%{CurTime()}

"function! FileTime()
  "let ext=tolower(expand("%:e"))
  "let fname=tolower(expand('%<'))
  "let filename=fname . '.' . ext
  "let msg=""
  "let msg=msg." ".strftime("<mod:%b,%d'%y|%H:%M:%S>",getftime(filename))
  "return msg
"endfunction

"function! CurTime()
"  let ftime=""
"  let ftime=ftime." ".strftime("%b,%d %y %H:%M:%S")
"  return ftime
"endfunction

"##############                                                                   
" Easier split navigation                                                                                                                               
"##############
" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

""""""""""""""""
"Highlight diff changes
"if !exists(":DiffOrig")
    "command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
          "\ | wincmd p | diffthis
"endif
"nmap <leader>d :DiffOrig<CR>

"Mapping for scratchpad
"nmap <leader>s :Sscratch<CR>

"Hihglight column=80
set wrap
set textwidth=80
set cc=80
hi ColorColumn guibg=#3D3D3D

"Put search results in vsplit
"nnoremap <silent><leader>r :redir @a<CR>:g//<CR>:redir END<CR>:10new<CR>:put! a<CR>

"highlight SpecialKey guifg=black
"

nmap <A-t> :tabnew<CR>


"niScope source search
function! SearchniScopeDriver()
   cd P:\Measurements\highSpeedDigitizers\niScope\driver\development\4.0\amundle\source\
   tabnew
   FufCoverageFile
endfunction
nmap<silent> <A-s>  :call SearchniScopeDriver()<CR>

"Fufbuffer
nmap<silent> <>  :call SearchniScopeDriver()<CR>
nmap <leader>f :FufBuffer<CR>

"OmniComplete
" omnicppcomplete options
set tags+=~/.vim/commontags
set tags+=~/.vim/tags/stl      
set tags+=~/.vim/tags/gl      
set tags+=~/.vim/tags/sdl      
set tags+=~/.vim/tags/qt4      

" --- OmniCppComplete ---
" -- required --
set nocp " non vi compatible mode
filetype plugin on " enable plugins
 
" -- optional --
" auto close options when exiting insert mode or moving away
"autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"set completeopt=menu,menuone
" automatically open and close the popup menu / preview window      
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif      
set completeopt=menuone,menu,longest,preview

 
" -- configs --
let OmniCpp_MayCompleteDot = 1 " autocomplete with .
let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)
let OmniCpp_NamespaceSearch = 1 " search namespaces in this and included files
let OmniCpp_ShowPrototypeInAbbr = 0 " show function prototype (i.e. parameters) in popup window
let OmniCpp_LocalSearchDecl = 0 " don't require special style of function opening braces
let OmniCpp_GlobalScopeSearch = 1      
let OmniCpp_ShowAccess = 1      
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]      


set nocp      
filetype plugin on      


set backupdir=~/vimtmp,.
set directory=~/vimtmp,.

"Search the word under cursor recursively in current dir
"map <C-F4> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>

"Type dts in insert mode to expand to a datestamp
:iab <expr> dts strftime("%c")
