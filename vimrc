set nocompatible
syntax on
filetype on
filetype indent on
filetype plugin on
set nu
set ai
set smarttab
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set ruler
set wildmenu

let mapleader=','

" turn off highlight search - turn on with set hls
set hls

set incsearch
" " case insensitive search
set ic
"
"set showtabline=2
"set tabpagemax=15
"nnoremap <silent> <C-n> :tabnext<CR>
"nnoremap <silent> <C-p> :tabprevious<CR>
nnoremap <silent> <C-n> :bn<CR>
nnoremap <silent> <C-p> :bp<CR>
"nnoremap <silent> <C-t> :tabnew .<CR>

"au BufWinLeave * mkview
"au BufWinEnter * silent loadview

"set iskeyword-=_
" this allows you to move between buffers and not have to save
set hidden

if has("gui_running")
  set mouse=a
  set lines=40
  "set cursorline
  "set guifont=Inconsolata\ 10
  "set guioptions-=m
  "set guioptions-=T
  set guioptions=
  set bg=dark
  colorscheme solarized

  "let g:miniBufExplModSelTarget = 1
  "let g:miniBufExplorerMoreThanOne = 0
  "let g:miniBufExplModSelTarget = 0
  "let g:miniBufExplUseSingleClick = 1
  "let g:miniBufExplMapWindowNavVim = 1
  "let g:miniBufExplVSplit = 25
  "let g:miniBufExplSplitBelow=1
else
  set bg=dark
  "let g:solarized_termcolors=256
  colorscheme solarized
  " Setting this to 128 works good
  "set t_Co=128

  " Set this for desert
  "set bg=light
  "set bg=dark
endif

"let g:miniBufExplModSelTarget = 1
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1

au BufNewFile,BufRead *.rhtml set syn=eruby
au BufNewFile,BufRead *.erb set ft=eruby.html

set dir=~/.vim/swaps
set backupdir=~/.vim/swaps

" need to investigate why this is here
" nnoremap <tab> %
" vnoremap <tab> %

set wrap
set textwidth=79
set formatoptions=qrn1
if exists("&colorcolumn")
  set colorcolumn=85
endif

nnoremap ; :

inoremap jj <ESC>

" ack.vim

set list listchars=tab:\ \ ,trail:·

autocmd Filetype *.js set nocindent

set autoread

"set noconfirm

"au FileType html,xml,xhtml so ~/.vim/ftplugin/html_autoclosetag.vim

" VIM UI {
 set cursorline                  " highlight current line
    hi cursorline guibg=#333333     " highlight bg color of current line
    hi CursorColumn guibg=#333333
" }

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
