"-------
" Vundle
"-------

set nocompatible
filetype off " required!

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'

"---------------
" Plugin Bundles
"---------------

Bundle 'chrisbra/NrrwRgn'
Bundle 'mutewinter/LustyJuggler'
Bundle 'Raimondi/delimitMate'
Bundle 'ervandew/supertab'
Bundle 'scrooloose/syntastic'
Bundle 'vim-scripts/taglist.vim'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'

Bundle 'nanotech/jellybeans.vim'
Bundle 'Lokaltog/vim-powerline'

Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-rails'

Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'

Bundle 'ChrisYip/Better-CSS-Syntax-for-Vim'
Bundle 'bbommarito/vim-slim'

" Deps for vim-snipmate
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "honza/snipmate-snippets"

Bundle 'garbas/vim-snipmate'

filetype plugin indent on

let mapleader=','

if has("gui_running")
  set mouse=a
  set lines=60
  set columns=120
  "set cursorline
  "set guifont=Inconsolata\ 10
  "set guioptions-=m
  "set guioptions-=T
  set guioptions=
  if has('mac')
    set guifont=Menlo\ for\ Powerline:h13
  elseif has('unix')
    set guifont=Menlo\ for\ Powerline
  end
endif

" -------------
" Lusty Juggler
" -------------
let g:LustyJugglerShowKeys=1
let g:LustyJugglerSuppressRubyWarning = 1
nnoremap <leader>, :e#<CR>

" ---------
" Syntastic
" ---------
"let g:syntastic_enable_signs=1
"let g:syntastic_auto_loc_list=1

" --------
" SuperTab
" --------
let g:SuperTabDefaultCompletionType="<c-x><c-n>"
let g:SuperTabContextDefaultCompletionType="<c-x><c-n>"

" UI
set ruler
set nu " Line numbers
set laststatus=2 "Always show statusline
set encoding=utf-8
set t_Co=256 " works well under SL on mac
if exists('+colorcolumn')
  set colorcolumn=80
endif

" Colors
set bg=dark
colorscheme jellybeans

" Behaviors
syntax on
set autoread
set wildmenu
set hidden " this allows you to move between buffers and not have to save
set autowrite " writes on make/shell commands

" Text format
set tabstop=2
set shiftwidth=2
set softtabstop=2
set cindent
set autoindent
set smarttab
set expandtab

" Searching
set hlsearch " Highlight search
set incsearch
set ignorecase

" visual
set showmatch " show matching bracket
set matchtime=2 " How many tenths of a second to blink

" Backups
set backup
set dir=~/.vim/tmp
set backupdir=~/.vim/backup

nnoremap <silent> <C-n> :bn<CR>
nnoremap <silent> <C-p> :bp<CR>

set wrap
set textwidth=79
set formatoptions=qrn1

nnoremap ; :

inoremap jj <ESC>

" ack.vim

set list listchars=tab:\ \ ,trail:·

autocmd Filetype *.js set nocindent

"set noconfirm

"au FileType html,xml,xhtml so ~/.vim/ftplugin/html_autoclosetag.vim

" Key (re)Mappings {

  map <C-J> <C-W>j<C-W>_
  map <C-K> <C-W>k<C-W>_
  map <C-L> <C-W>l<C-W>_
  map <C-H> <C-W>h<C-W>_

  nnoremap j gj
  nnoremap k gk
" }

let g:Tlist_Ctags_Cmd = '$HOME/opt/bin/ctags'

map <leader>d :NERDTreeToggle<CR>
map <leader>l :Tlist<cr>
map <leader>gs :GStatus
map <leader>gb :GBlame
nmap <leader>a :Ack <c-r>=expand("<cword>")<cr>
nmap <leader>s :Ack
" remove current highlighted word
nnoremap <leader><space> :noh<cr>

set modeline modelines=5
