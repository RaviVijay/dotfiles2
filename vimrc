"To not copy line numbers :set mouse=a" 
""" Vertical Split:
"" :set minwidth=80
"":nmap <Tab> <c-w><c-w><c-w>=
" ===================================================================
" General Formatting
" ===================================================================
filetype plugin on
filetype indent on
set   nocompatible
set   expandtab     " Replace tab with spaces
set   softtabstop=4 " makes the spaces feel like real tabs
set   tabstop=4
set   backspace=2   " backspace can join lines
set   shiftwidth=4      " <Tab> at start of line tabs 4 chars
set   smarttab          " <Tab> at start of line tabs <shiftwidth> chars
set   ruler                     " show cursor position
set   nottybuiltin
set   magic                     " regular expressions the way I'm used to them
set   nobackup          " don't clutter my account with *.bak!
set   nowritebackup     " don't keep a backup copy during the edit session
set   nodigraph         " I don't need sticking digraphs ...
set   hlsearch        " When there is a previous search pattern, highlight all
                    " its matches.
set   incsearch         " Incremental search.
set   joinspaces        " Join adds two spaces after a period.
set   textwidth=0   " Overriden later by the autocommands
set   autoindent      " Copy indent from current line when starting a new line
                    " (typing <CR> in Insert mode or when using the "o" or "O"
                    " command).
                    " (typing <CR> in Insert mode or when using the "o" or "O"
                    " command).
set formatoptions=c,q,r,t " This is a sequence of letters which describes how
                    " automatic formatting is to be done.
                    "
                    " letter    meaning when present in 'formatoptions'
                    " ------    ---------------------------------------
                    " c         Auto-wrap comments using textwidth, inserting
                    "           the current comment leader automatically.
                    " q         Allow formatting of comments with "gq".
                    " r         Automatically insert the current comment leader
                    "           after hitting <Enter> in Insert mode. 
                    " t         Auto-wrap text using textwidth (does not apply
                    "           to comments)
set showmatch       " When a bracket is inserted, briefly jump to the matching
                    " one. The jump is only done if the match can be seen on the
                    " screen. The time to show the match can be set with
                    " 'matchtime'.
set ignorecase      " Ignore case in search patterns.
set showcmd         " Show (partial) command in status line.
set number          " Show line numbers.
set smartcase       " Override the 'ignorecase' option if the search pattern
                    " contains upper case characters.
 
 
map R :so $MYVIMRC
map Q :qa<CR>
map W :wa<CR>
map Z :wq!<CR>
nnoremap <esc> :noh<return><esc>

syntax on

au BufNewFile,BufRead *.svh set filetype=verilog_systemverilog

" BACKUPS, SWAPFILES, VIEWDIR, TMPDIR  "{{{1
" ====================================================================================

"echomsg &runtimepath
"echomsg expand("$VIMRUNTIME")


" IF BKDIR IS NOT SET OR EMPTY, SET {{{4
if $BKDIR == ""
   let $BKDIR=expand("$HOME/.bk")
   if !isdirectory(expand("$BKDIR"))
          call mkdir(expand("$BKDIR"), "p", 0700)
   endif
endif


" MAKE DIRS IF mkdir exists {{{4
if exists("*mkdir")
   let &viewdir=expand("$BKDIR") . "/.vim/viewdir"
   if !isdirectory(expand(&viewdir))|call mkdir(expand(&viewdir), "p", 0700)|endif
   if !isdirectory(expand("$BKDIR/tmp/.vim"))|call mkdir(expand("$BKDIR/tmp/.vim"), "p", 0700)|endif
   if !isdirectory(expand("$BKDIR/.vim/backups"))|call mkdir(expand("$BKDIR/.vim/backups"), "p", 0700)|endif
   if !isdirectory(expand("$BKDIR/.vim/undos"))|call mkdir(expand("$BKDIR/.vim/undos"), "p", 0700)|endif
endif


" SETTINGS USING NEW DIRS {{{4
let &dir=expand("$BKDIR") . "/.vim"
let &backupdir=expand("$BKDIR") . "/.vim/backups"
"let &undodir=expand("$BKDIR") . "/.vim/undos"
"set undofile
"let &verbosefile=expand("$BKDIR") . "/.vim/vim-messages.


" VIMINFO {{{4
" COMMENTED OUT {{{5
"  "       Maximum number of lines saved for each register
"  %       When included, save and restore the buffer lis
"  '       Maximum number of previously edited files for which the marks are remembere
"  /       Maximum number of items in the search pattern history to be saved
"  :        Maximum number of items in the command-line history
"  <       Maximum number of lines saved for each register.
"   @       Maximum number of items in the input-line history
"  h       Disable the effect of 'hlsearch' when loading the viminfo
"  n       Name of the viminfo file.  The name must immediately follow the 'n'. 
"  r       Removable media.  The argument is a string
"  s       Maximum size of an item in Kbyte
" }}}5 COMMENTED OUT

let &viminfo="%203,'200,/800,h,<500,:500,s150,r/tmp,r" . expand("$BKDIR") . "/tmp/.vim,n" . expand("$BKDIR") ."/.vim/.vinfo"
" }}}4 ENDOF VIMINFO

" --------------------------------------------------- }}}1 ENDOF BACKUPS, SWAPFILES, VIEWDIR, TMPDIR
autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p

call pathogen#infect()
execute pathogen#infect()

nnoremap <F5> :GundoToggle<CR>


set foldmethod=indent   
set foldnestmax=10
set nofoldenable
set foldlevel=2

"set rtp+=/usr/local/opt/fzf
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0



" Experimental
" Autoload vimrc
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

