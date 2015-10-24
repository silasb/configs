"-------
" Vundle
"-------

set nocompatible
filetype off " required by vundle
set rtp+=~/.nvim/bundle/vundle
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-rails'
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'AndrewRadev/vim-eco'
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'vim-ruby/vim-ruby'
Plugin 'fatih/vim-go'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'slim-template/vim-slim'
Plugin 'digitaltoad/vim-jade'
Plugin 'majutsushi/tagbar'
Plugin 'rust-lang/rust.vim'
Plugin 'junegunn/vim-easy-align'
Plugin 'unblevable/quick-scope'
Plugin 'groenewege/vim-less'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'gabrielelana/vim-markdown'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-fugitive'

Plugin 'airblade/vim-gitgutter'

" Deps for vim-snipmate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

" Ruby/Rails themed extensions
Plugin 'tpope/vim-endwise'

Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'

" Theme
"Plugin 'w0ng/vim-hybrid'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let g:gitgutter_enabled = 1
highlight clear SignColumn

let g:bookmark_highlight_lines = 1
let g:bookmark_manage_per_buffer = 1

let g:buffergator_suppress_keymaps = 1

set backupdir=~/.nvim/backup/
set directory=~/.nvim/backup/

set guioptions=
set guifont=Menlo\ Regular:h14"

filetype plugin indent on
syntax on

let mapleader = "\<space>"

" Ctrl-P

"let g:ctrlp_map = '<leader>t'
nnoremap <leader>t :CtrlPBufTag<CR>

set hidden

" text format
set tabstop=2
set shiftwidth=2
set softtabstop=2
set cindent
set autoindent
set smarttab
"set expandtab

" searching
set hlsearch
set incsearch
set ignorecase

set nu
:nmap \o :set paste!<CR>

:nmap j gj
:nmap k gk

" nnoremap ; :

:nmap <C-e> :e#<CR>
" nnoremap <leader>, #e<CR>
" nnoremap <silent> <C-n> :bnext<CR>
" nnoremap <silent> <C-p> :bprev<CR>
:nnoremap <leader>l :ls<cr>:b<space>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

" max height of current split
" ctrl + w _
" max width of current vsplit
" ctrl + w |
" reset splits
" ctrl + w =
"
" close every window in the current tabview but the current one
" ctrl + W o

nnoremap <leader><space> :noh<CR>

autocmd Filetype *.js set nocindent

colorscheme desert

" comment color for hybrid #707880
highlight LineNr guifg=#b294bb

nmap \\ <leader>ci
vmap \\ <leader>ci

map <leader>, :NERDTreeToggle<CR>
map <leader>f :NERDTreeFind<CR>
map <leader>b :BuffergatorToggle<CR>
map <leader>. :Tagbar<CR>

set mouse=
set clipboard+=unnamedplus

set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set cursorline
