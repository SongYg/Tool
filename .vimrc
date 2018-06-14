set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

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
" Put your non-Plugin stuff after this lineset nocompatible    " use vim defaults
set backspace=2		"make backspace like most other apps
"set ls=2            " allways show status line
set tabstop=4       " numbers of spaces of tab character
set shiftwidth=4    " numbers of spaces to (auto)indent
set scrolloff=4     " keep 3 lines when scrolling
set showcmd         " display incomplete commands
set hlsearch        " highlight searches
set incsearch       " do incremental searching
set ruler           " show the cursor position all the time
set visualbell t_vb=    " turn off error beep/flash
set novisualbell    " turn off visual bell
set nobackup        " do not keep a backup file
set number          " show line numbers
set ignorecase      " ignore case when searching
"set noignorecase   " don't ignore case
"set title           " show title in console title bar
set ttyfast         " smoother changes
"set ttyscroll=0        " turn off scrolling, didn't work well with PuTTY
set modeline        " last lines in document sets vim mode
set modelines=3     " number lines checked for modelines
set shortmess=atI   " Abbreviate messages
set nostartofline   " don't jump to first character when paging
set whichwrap=b,s,h,l,<,>,[,]   " move freely between files
"set viminfo='20,<50,s10,h
set mouse=a

set autoindent     " always set autoindenting on
set smartindent        " smart indent
set cindent            " cindent
"set noautoindent
"set nosmartindent
"set nocindent  

"set autowrite      " auto saves changes when quitting and swiching buffer
"set expandtab      " tabs are converted to spaces, use only when required
"set sm             " show matching braces, somewhat annoying...
"set nowrap         " don't wrap lines

highlight Normal guibg=grey90
highlight Cursor guibg=Green guifg=NONE
highlight NonText guibg=grey80
highlight Constant gui=NONE guibg=grey95
highlight Special gui=NONE guibg=grey95

" Color settings for the cursor (different colors for insert mode)
" Modified for black
"highlight Cursor   guifg=white  guibg=black
"highlight Cursor   guifg=red  guibg=lightgreen
highlight Cursor   guifg=white  guibg=black
highlight iCursor  guifg=white  guibg=black

" Cursor shape (insert => vertical line)
set guicursor=n-v-c:block-Cursor
"set guicursor+=i:ver30-iCursor




	" Gui background color
"	 highlight Normal guibg=lightblue
"	highlight Normal guibg=lightyellow
"	highlight Normal guibg=#fffddd
"	highlight Normal guibg=#99cccc
"	 highlight Normal guibg=lightmagenta
"	 highlight Normal guibg=lightgreen
" Modified for black
	highlight Normal guibg=#eeeeee
	highlight Normal guibg=white guifg=darkblue
	highlight Normal guibg=black guifg=white

   highlight Visual guibg=black 
"   highlight Visual guibg=lightmagenta


:highlight Normal ctermfg=grey ctermbg=black





syntax on           " syntax highlighing
if has("gui_running")
    " See ~/.gvimrc
    set guifont=Monospace\ 10  " use this font
    set lines=50       " height = 50 lines
    set columns=100        " width = 100 columns
    set background=light   " adapt colors for background
    set selectmode=mouse,key,cmd
"    set keymodel=
else
"    colorscheme elflord    " use this color scheme
    set background=dark        " adapt colors for background
endif

if has("autocmd")
    " Restore cursor position
    au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

    " Filetypes (au = autocmd)
    au FileType helpfile set nonumber      " no line numbers when viewing help
    au FileType helpfile nnoremap <buffer><cr> <c-]>   " Enter selects subject
    au FileType helpfile nnoremap <buffer><bs> <c-T>   " Backspace to go back
    
    " When using mutt, text width=72
    au FileType mail,tex set textwidth=72
    au FileType cpp,c,java,sh,pl,php,asp  set autoindent
    au FileType cpp,c,java,sh,pl,php,asp  set smartindent
    au FileType cpp,c,java,sh,pl,php,asp  set cindent
    "au BufRead mutt*[0-9] set tw=72
    
    " Automatically chmod +x Shell and Perl scripts
    "au BufWritePost   *.sh             !chmod +x %
    "au BufWritePost   *.pl             !chmod +x %

    " File formats
    au BufNewFile,BufRead  *.pls    set syntax=dosini
    au BufNewFile,BufRead  modprobe.conf    set syntax=modconf
endif
