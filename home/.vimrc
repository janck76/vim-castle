" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Dec 17
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" Vim python-mode. PyLint, Rope, Pydoc, breakpoints from box.
Plugin 'klen/python-mode'

" BASH IDE -- Write and run BASH-scripts using menus and hotkeys. 
Plugin 'bash-support.vim'

" Perl-IDE Using perl-support Plugin"
Plugin 'perl-support.vim'

" ZoomWindow - zoom into and out of a window
Plugin 'ZoomWin'

" CSApprox - Makes GVim-only colorschemes Just Work in terminal Vim
" Plugin 'CSApprox'

" Surround.vim is all about surroundings: parentheses, brackets, quotes, XML tags, and more.  The plugin provides mappings to easily delete, change and add such surroundings in pairs
Plugin 'Surround.vim'

" SingleCompile : Make it more convenient to compile or run a single source file. 
Plugin 'xuhdev/SingleCompile'

" ruby-vim
Plugin 'vim-ruby/vim-ruby'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" set updatecount=200
" set updatetime=4000
set backupdir=~/.backup,./.backup,.,/tmp
set directory=.,./.backup,/tmp
"set dir=/tmp

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END
  
  " Compiler plugins
  autocmd FileType ruby compiler ruby

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
    \ | wincmd p | diffthis
endif

" Jan C settings
"

" Fargevalg


" Start without the toolbar
set guioptions-=m

if &term =~ '256color'
        set t_ut=
endif

try
    " http://ethanschoonover.com/solarized/vim-colors-solarized
    if !has('gui_running') 
        set t_Co=16
        let g:CSApprox_loaded=0
    endif

    set background=dark
    "let g:solarized_termcolors=256
    let g:solarized_contrast = "normal"
    let g:solarized_termtrans = 1
    let g:solarized_visibility = "normal"
    colorscheme solarized
catch /^Vim\%((\a\+)\)\=:E185/
    set t_Co=256
    colorscheme desert
endtry

" Fontvalg
" set guifont=Consolas:h9:cANSI
"set guifont=Meslo\ LG\ S\ for\ Powerline\ RegularForPowerline\ 9

" Tabs til space
set expandtab

" Tab & shift bredde
set tabstop=4
set shiftwidth=4

" make tab in v mode ident code
vmap <tab> >gv
vmap <s-tab> <gv

" make tab in normal mode ident code
nmap <tab> I<tab><esc>
nmap <s-tab> ^i<bs><esc>

" A more informative status line
:set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v]\ [%p%%]\ [LEN=%L]
:set laststatus=2

" Toggle menu and toolbar
map <silent> <C-F2> :if &guioptions =~# 'T' <Bar>
    \set guioptions-=T <Bar>
    \set guioptions-=m <bar>
\else <Bar>
    \set guioptions+=T <Bar>
    \set guioptions+=m <Bar>
\endif<CR>

" autosource .vimrc after save
au! BufWritePost .vimrc source %

" Adding a more visual cursor
set cursorline

" CTRL+S - save file
imap <C-s> <esc>:w<cr>
map <C-s> :w<cr>

" This command simply overwrites the gf command and instead opens the file under
" the cursor with the :edit command. If it does not exist, this command opens a new
" empty buffer.
map gf :new <cfile><CR>


" vimdiff
" -----------------------------------------------------------------------------
" Space         - next diff
" Shift+Alt Gr  - previous diff
" =8            - resize the current window to 80 columns (I like 80 columncode).
" =0            - resize the left and right sides to be equally sized.
" Control-L     - refresh the screen as well as refresh the diffs, incase you have 
"                 been making modifications.
"
" -----------------------------------------------------------------------------
if &diff
    noremap <space> ]cz.
    noremap <M-space> [cz.
    noremap =8 :vertical resize 82<CR>
    noremap =0 :execute "vertical resize " . (&columns+1)/2<CR>
    noremap <C-L> :diffupdate<CR><C-L>
endif


" let g:UltiSnipsJumpForwardTrigger="<c-q>"
" let g:UltiSnipsJumpBackwardTrigger="<c-w>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

set guioptions-=T
set guioptions-=r
set guioptions-=L


" http://vim.wikia.com/wiki/Different_syntax_highlighting_within_regions_of_a_file
function! TextEnableCodeSnip(filetype,start,end,textSnipHl) abort
  let ft=toupper(a:filetype)
  let group='textGroup'.ft
  if exists('b:current_syntax')
    let s:current_syntax=b:current_syntax
    " Remove current syntax definition, as some syntax files (e.g. cpp.vim)
    " do nothing if b:current_syntax is defined.
    unlet b:current_syntax
  endif
  execute 'syntax include @'.group.' syntax/'.a:filetype.'.vim'
  try
    execute 'syntax include @'.group.' after/syntax/'.a:filetype.'.vim'
  catch
  endtry
  if exists('s:current_syntax')
    let b:current_syntax=s:current_syntax
  else
    unlet b:current_syntax
  endif
  execute 'syntax region textSnip'.ft.'
  \ matchgroup='.a:textSnipHl.'
  \ start="'.a:start.'" end="'.a:end.'"
  \ contains=@'.group
endfunction



" Toggle spellchecking
" Default lang: no,en_us
set spelllang=no,en_us
" set spell
imap <F5> <C-o>:setlocal spell! spell?<CR>


" Copy to system clipboard (nyttig i visual mode)
map <C-c> "+y<CR>

" vim-airline powerline fonts integration
let g:airline_powerline_fonts = 1
let g:airline_theme = 'solarized' 
" Disable autolasting av vim-airline overstyring av tmuxline
let g:airline#extensions#tmuxline#enabled = 0

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"


" Cycle through buffers
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>

" Cycle through buffers
" nnoremap <Tab> :bnext<CR>
" nnoremap <S-Tab> :bprevious<CR>


" Change leader from deafult \ to ,
let mapleader=","


" Python-mode settings 
" Turn on the whole plugin
let g:pymode = 1
" Turn off plugin's warnings
let g:pymode_warnings = 1
" Add paths to sys.path
" Value is list of path's strings
let g:pymode_paths = []

" Trim unused white spaces on save
let g:pymode_trim_white_spaces = 1

" Setup default pyhton options
let g:pyhton_options = 1

" Setup max line length
let g:pyhton_options_max_line_length = 79

" Setup pymode quickfix window
let g:pymode_quickfix_minheight = 3
let g:pymode_quickfix_maxheight = 6


" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" SingleCompile settings
nmap <F9> :SCCompile<cr>
nmap <F10> :SCCompileRun<cr>
let g:SingleCompile_showquickfixiferror = 1
let g:SingleCompile_silentcompileifshowquickfix = 1
let g:SingleCompile_showresultafterrun = 0

