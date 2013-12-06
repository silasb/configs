"-------
" Vundle
"-------

set nocompatible
filetype off " required by vundle
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-sleuth'
Bundle 'tpope/vim-rails'
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'Raimondi/delimitMate'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'vim-ruby/vim-ruby'

Bundle 'airblade/vim-gitgutter'
let g:gitgutter_enabled = 1
highlight clear SignColumn

" Deps for vim-snipmate
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'

" Theme
Bundle 'w0ng/vim-hybrid'

set backupdir=~/.vim/backup/
set directory=~/.vim/backup/

set guioptions=
set guifont=Menlo\ Regular:h12"

filetype plugin indent on
syntax on

let mapleader = "\<space>"

" Ctrl-P

let g:ctrlp_map = '<leader>t'

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

colorscheme hybrid

" comment color for hybrid #707880
highlight LineNr guifg=#b294bb
