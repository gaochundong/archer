" use vim settings, rather than vi settings (much better!)
" this must be first, because it changes other options as side effect
set nocompatible              " not compatible with vi
filetype off                  " do not check file type

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'vim-airline/vim-airline'         " lean & mean status/tabline for vim that's light as air
Plugin 'vim-airline/vim-airline-themes'  " a collection of themes for vim-airline
Plugin 'vim-scripts/taglist.vim'         " provides an overview of the structure of source code files
Plugin 'vim-syntastic/syntastic'         " sytax checking hacks for vim
Plugin 'airblade/vim-rooter'             " change vim working directory to project root
Plugin 'honza/vim-snippets'              " vim-snipmate default snippets
Plugin 'justinmk/vim-sneak'              " jump to any location specified by two characters
Plugin 'kien/ctrlp.vim'                  " fuzzy file, buffer, mru, tag, etc finder
Plugin 'majutsushi/tagbar'               " displays tags in a window, ordered by scope
Plugin 'mhinz/vim-signify'               " show a diff using vim its sign column
Plugin 'sjl/gundo.vim'                   " visualize your vim undo tree
Plugin 'tpope/vim-fugitive'              " a git wrapper so awesome
Plugin 'tpope/vim-sleuth'                " heuristically set buffer options
Plugin 'tpope/vim-surround'              " quoting and parenthesizing made simple
Plugin 'tpope/vim-vinegar'               " combine with netrw to create a delicious salad dressing
Plugin 'tpope/vim-dispatch'              " asynchronous build and test dispatcher
Plugin 'scrooloose/nerdtree'             " a file system tree explorer for vim editor
Plugin 'scrooloose/nerdcommenter'        " intensely orgasmic commenting

" languages
Plugin 'elzr/vim-json'                   " json
Plugin 'plasticboy/vim-markdown'         " markdown
Plugin 'kongo2002/fsharp-vim'            " fsharp
Plugin 'rust-lang/rust.vim'              " rust
Plugin 'derekwyatt/vim-scala'            " scala
Plugin 'OrangeT/vim-csharp'              " csharp
Plugin 'artur-shaik/vim-javacomplete2'   " java

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on    " use different indent for different file type
" To ignore plugin indent changes, instead use:
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" enable syntax highlighting
syntax on

" enable color theme
colorscheme desert
set background=dark

" add a bit extra margin to the left
set foldcolumn=1

" set how many lines of history vim has to remember
set history=700

" set to auto read when a file is changed from the outside
" reload files when changed on disk
set autoread

" highlight current line
set cursorline

" set 7 lines to the cursor when moving vertically using j/k
set so=7

" use spaces instead of tabs
set expandtab

" make tabs as wide as two spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2

" auto indent and smart indent
set ai
set si

" show line numbers
set number

" show status line
set laststatus=2

" enable mouse in all modes
set mouse=a

" height of the command bar
set cmdheight=2

" disable error bells
set noerrorbells
set novisualbell

" don't reset cusor to start of line when moving around
set nostartofline

" show the cusor position
set ruler

" don't show the intro message when starting vim
set shortmess=atI

" show the current mode
set showmode

" show the filename in the window titlebar
set title

" show matching brackets when text indicator is over them
set showmatch

" how many tenths of a second to blink when matching brackets
set mat=2

" show the (partial) command as it's being typed
set showcmd

" highlight searches
set hlsearch

" ignore case of searches
set ignorecase

" highlight dynamically as pattern is typed
set incsearch

" when searching try to be smart about cases
set smartcase

" for regular expressions turn magic on
set magic

" respect modeline in files
set modeline
set modelines=4

" use os clipboard by default
set clipboard=unnamed

" enhance command-line completion
set wildmenu

" using utf-8 without bom
set encoding=utf-8 nobomb

" use unix as the standard file type
set ffs=unix,dos,mac

" configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" don't add empty newlines at the end of files
set noeol

" a buffer becomes hidden when it is abandoned
set hid

" turn backup off
set nobackup
set nowb

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keyboard Shortcuts

" Change the map leader from \\ to ,
let mapleader=","
let maplocalleader="\\"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Settings

" NERDTree settings {{{
" ,n will open the NERD tree if it is not visible
nnoremap <leader>n :NERDTreeFocus<CR>
" ,f will find the current file in the tree 
nnoremap <leader>f :NERDTreeClose<CR>:NERDTreeFind<CR>
" ,c will close the NERD tree in this tab
nnoremap <leader>c :NERDTreeClose<CR>

" Store the bookmarks file
let NERDTreeBookmarksFile=expand("$HOME/.vim/NERDTreeBookmarks")

" Show the bookmarks table on startup
let NERDTreeShowBookmarks=1

" Show hidden files
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1

" Quit on opening files from the tree
let NERDTreeQuitOnOpen=1

" Highlight the selected entry in the tree
let NERDTreeHighlightCursorline=1

" Use a single-click to fold/unfold directories 
" and a double-click to open files
let NERDTreeMouseMode=2

" Don't display these kinds of files
let NERDTreeIgnore=[ 
    \ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$',
    \ '\.o$', '\.so$', '\.egg$', '^\.git$',
    \ '\.idea$', '\.iml$', '\.svn$', '^\.scc$',
    \ '\.DS_Store$', '^target$' ]

" }}}
