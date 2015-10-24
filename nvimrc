"-------
" Vundle
"-------

set nocompatible
filetype off " required by vundle
set rtp+=~/.nvim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-sleuth'
Bundle 'tpope/vim-rails'
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'AndrewRadev/vim-eco'
Bundle 'Raimondi/delimitMate'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'vim-ruby/vim-ruby'
Bundle 'fatih/vim-go'
Bundle 'Xuyuanp/nerdtree-git-plugin'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'slim-template/vim-slim'
Bundle 'digitaltoad/vim-jade'
Bundle 'majutsushi/tagbar'
Plugin 'rust-lang/rust.vim'
Plugin 'junegunn/vim-easy-align'
Bundle 'unblevable/quick-scope'
Plugin 'groenewege/vim-less'
Plugin 'jeetsukumaran/vim-buffergator'
let g:buffergator_suppress_keymaps = 1
Plugin 'MattesGroeger/vim-bookmarks'
let g:bookmark_highlight_lines = 1
let g:bookmark_manage_per_buffer = 1
Plugin 'gabrielelana/vim-markdown'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-fugitive'

Bundle 'airblade/vim-gitgutter'
let g:gitgutter_enabled = 1
highlight clear SignColumn

" Deps for vim-snipmate
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'

" Ruby/Rails themed extensions
Bundle 'tpope/vim-endwise'

Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'

" Theme
"Bundle 'w0ng/vim-hybrid'

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

set cursorline
set ruler
