if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=ucs-bom,utf-8,latin1
endif

set nocompatible        " Use Vim defaults (much better!)
set bs=indent,eol,start         " allow backspacing over everything in insert mode
"set ai                 " always set autoindenting on
set backup             " keep a backup file
set viminfo='20,\"50    " read/write a .viminfo file, don't store more
                        " than 50 lines of registers
set history=1000        " keep 1000 lines of command line history
set ruler               " show the cursor position all the time

" Only do this part when compiled with support for autocommands
if has("autocmd")

  augroup redhat
  autocmd!

  " In text files, always limit the width of text to 78 characters
  "autocmd BufRead *.txt set tw=78
  " When editing a file, always jump to the last cursor position

  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif

  " don't write swapfile on most commonly used directories for NFS mounts or USB sticks
  " putting these files in /tmp instead
  "autocmd BufNewFile,BufReadPre /media/*,/run/media/*,/mnt/* set directory=~/tmp,/var/tmp,/tmp

  " start with spec file template
  autocmd BufNewFile *.spec 0r /usr/share/vim/vimfiles/template.spec

  augroup END

endif

if has("cscope") && filereadable("/usr/bin/cscope")
   set csprg=/usr/bin/cscope
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add $PWD/cscope.out
   " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   endif
   set csverb
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

filetype plugin on

if &term=="xterm"
     set t_Co=8
     set t_Sb=^[[4%dm
     set t_Sf=^[[3%dm
endif

" Don't wake up system with blinking cursor:
" http://www.linuxpowertop.org/known.php
let &guicursor = &guicursor . ",a:blinkon0"

set paste

"set background=dark
"set foldmethod=indent
"set foldnestmax=5
"set nofoldenable
"set noundofile
"set nobackup
"set nowritebackup

"colorscheme palenight
"colorscheme vaporwave
colorscheme elflord
syntax on

" Normal refers to ordinary text
" NonText refers to characters that are not considered as text
" Cursor refers to a cursor
" ErrorMsg refers to messages depicting errors

" comments dark green
" highlight Comment ctermfg=22
" dark blue
highlight Comment ctermfg=60

" foreground more white, background almost black
"highlight Normal ctermfg=252 ctermbg=232
" or background full black
"highlight Normal ctermfg=250 ctermbg=black
"highlight NonText ctermfg=199

" increase undo
set undolevels=2000

" number of lines to show below cursor
set scrolloff=2

" swap file, backup file, undo file (with % delimited path)
set directory=/tmp//
set backupdir=/tmp//
set undodir=/tmp//

" bottom status line
set laststatus=2
set statusline=
set statusline+=%y%r:\ %F\ %m
set statusline+=%=
set statusline+=%p%%\ \ (%c:%l)\ \ [%{&fileencoding?&fileencoding:&encoding}](%{&fileformat}\)
set statusline+=\ 
highlight statusline ctermbg=52 ctermfg=38

" sets the term window title
set title

" allows cursor placement with the mouse
" hold SHIFT to select/copy to clipboard
set mouse=nicr
nmap <F1> <nop>

