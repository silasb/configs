set nocompatible
syntax on
filetype on
filetype indent on
filetype plugin on
set background=dark
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
nnoremap <silent> <S-t> :FuzzyFinderBuffer<CR>
imap <C-z> <%=  %><ESC>bhi
imap <C-x> <%  %><ESC>bhi


map <F5> :w<CR>:make<CR>

map <leader>d :NERDTreeToggle<CR>

colorscheme ir_black

set mouse=a

"au BufWinLeave * mkview
"au BufWinEnter * silent loadview

"set iskeyword-=_
" this allows you to move between buffers and not have to save
set hidden

" mac-like saving
map <A-s> <Esc>:w<CR>
imap <A-s> <Esc>:w<CR>

if has("gui_running")
  set lines=40
  "set cursorline
  set guifont=Inconsolata\ 12
  "set guioptions-=m
  set guioptions-=T

  let g:miniBufExplModSelTarget = 1
  let g:miniBufExplorerMoreThanOne = 0
  let g:miniBufExplModSelTarget = 0
  let g:miniBufExplUseSingleClick = 1
  let g:miniBufExplMapWindowNavVim = 1
  let g:miniBufExplVSplit = 25
  let g:miniBufExplSplitBelow=1
endif

au BufNewFile,BufRead *.rhtml set syn=eruby
au BufNewFile,BufRead *.erb set ft=eruby.html

set bg=light
