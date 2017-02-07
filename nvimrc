"-------
" vim-plug
"-------

set nocompatible

call plug#begin('~/.local/share/nvim/plugged')

" Plugins go here
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-sleuth'
"Plug 'tpope/vim-rails'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'cakebaker/scss-syntax.vim'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
"Plug 'vim-ruby/vim-ruby'
Plug 'fatih/vim-go'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
"Plug 'majutsushi/tagbar'
Plug 'junegunn/vim-easy-align'
"Plug 'kepbod/quick-scope'
"Plug 'groenewege/vim-less'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-fugitive'

Plug 'airblade/vim-gitgutter'

" Deps for vim-snipmate
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
"Plug 'garbas/vim-snipmate'
"Plug 'honza/vim-snippets'

"Plug 'tpope/vim-endwise'

"Plug 'kana/vim-textobj-user'
"Plug 'nelstrom/vim-textobj-rubyblock'

Plug 'neomake/neomake'
Plug 'itchyny/lightline.vim'

" Theme
"Plugin 'w0ng/vim-hybrid'

call plug#end()

set noshowmode

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"hi modified guibg=orange guifg=black ctermbg=lightred ctermfg=black
"set g:lightline+=%{SyntasticStatuslineFlag()}

"
" Custom lightline configuration
"

let g:lightline = {
      \ 'component': {
      \   'modified': '%#ModifiedColor#%{MyModified()}',
      \ }
      \ }
function! MyModified()
  let map = { 'V': 'n', "\<C-v>": 'n', 's': 'n', 'v': 'n', "\<C-s>": 'n', 'c': 'n', 'R': 'n'}
  let mode = get(map, mode()[0], mode()[0])
  if mode == 't'
    let mode = 'n'
  endif
  let bgcolor = {'n': [240, '#585858'], 'i': [31, '#0087af']}
  exe printf('hi ModifiedColor ctermfg=196 ctermbg=%d guifg=#ff0000 guibg=%s term=bold cterm=bold',
        \ bgcolor[mode][0], bgcolor[mode][1])
  return &modified ? 'M' : &modifiable ? '' : '-'
endfunction

"
" Linting
"

let g:neomake_javascript_enabled_makers = ['eslint']
"autocmd! BufWritePost * Neomake
let g:neomake_javascript_eslint_exe = system('PATH=$(npm bin):$PATH && which eslint | tr -d "\n"')

function! Lint()
  if &filetype =~ 'javascript'
    Neomake eslint
  else
    Neomake
  end
endfunction

augroup lint_events
  autocmd!
  autocmd BufWritePost * call Lint()
augroup end

let g:gitgutter_enabled = 1
highlight clear SignColumn

let g:bookmark_highlight_lines = 1
let g:bookmark_manage_per_buffer = 1

let g:buffergator_suppress_keymaps = 1
let g:buffergator_sort_regime = 'mru'
let g:buffergator_show_full_directory_path = 0

set backupdir=~/.nvim/backup/
set directory=~/.nvim/backup/

set guioptions=
set guifont=Menlo\ Regular:h14"

filetype plugin indent on
syntax on

let mapleader = "\<space>"

if executable('fzf')
  " FZF {{{
  "let g:fzf_layout = { 'window': 'enew' }

  " <C-p> or <C-t> to search files
  nnoremap <silent> <C-t> :FZF -m<cr>
  nnoremap <silent> <C-p> :FZF -m<cr>
  nnoremap <leader>t :FZF!<CR>

  let g:fzf_action = {
        \ 'ctrl-s': 'split',
        \ 'ctrl-v': 'vsplit'
        \ }

  imap <C-x><C-f> <plug>(fzf-complete-file-ag)
  imap <C-x><C-l> <plug>(fzf-complete-line)
  inoremap <S-Tab> <C-x><C-l>
  " }}}
else
  " Ctrl-P {{{
  "let g:ctrlp_map = '<leader>t'
  "let g:probe_ignore_files = ['node_modules']
  " }}}
end

set hidden

" text format
"set tabstop=2
"set shiftwidth=2
"set softtabstop=2
"set cindent
set autoindent
"set smarttab

" searching
set hlsearch
set incsearch
set ignorecase

set nu
set relativenumber
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
" should be `<C-H>', but there is in the current version of libterm that
" affects this.
nnoremap <BS> <C-W><C-H>

nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>

"nnoremap B ^
"nnoremap E $
" $/^ doesn't do anything
"nnoremap $ <nop>
"nnoremap ^ <nop>

" Reformat whole file
nnoremap g= gg=G``

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

" neomake
nmap <Leader><Space>o :lopen<CR>      " open location window
nmap <Leader><Space>c :lclose<CR>     " close location window
nmap <Leader><Space>, :ll<CR>         " go to current error/warning
nmap <Leader><Space>n :lnext<CR>      " next error/warning
nmap <Leader><Space>p :lprev<CR>      " previous error/warning

"autocmd Filetype *.js set nocindent

autocmd BufRead,BufNewFile *.css setlocal ts=4 sts=4 sw=4
autocmd BufRead,BufNewFile *.scss setlocal ts=4 sts=4 sw=4

autocmd BufRead,BufNewFile *.js setlocal ts=4 sts=4 sw=4
"autocmd FileType javascript set tabstop=2|set shiftwidth=2|set expandtab
" Enable JSX rendering for JS files
let g:javascript_plugin_jsdoc = 1
let g:jsx_ext_required = 0

colorscheme desert

" comment color for hybrid #707880
highlight LineNr guifg=#b294bb

nmap \\ <leader>ci
vmap \\ <leader>ci

nnoremap <expr><silent> \| !v:count ? "<C-W>v<C-W><Right>" : '\|'
nnoremap <expr><silent> _  !v:count ? "<C-W>s<C-W><Down>"  : '_' 
nmap <Tab> <C-W>w
nmap <S-Tab> <C-W>W
"nmap <C-Tab> >>
"nmap <C-S-Tab> <<

map <leader>, :NERDTreeToggle<CR>
map <leader>f :NERDTreeFind<CR>
map <leader>b :BuffergatorToggle<CR>
map <leader>. :Tagbar<CR>
map <leader>a :Ack <cword> 
"nnoremap <leader>bs :cex []<BAR>bufdo vimgrepadd @@g %<BAR>cw<s-left><s-left><right>

set mouse=
set clipboard+=unnamedplus

set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set cursorline
set list
"set expandtab
