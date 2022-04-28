"-------
" vim-plug
"-------

runtime macros/matchit.vim
set nocompatible

call plug#begin('~/.local/share/nvim/plugged')

" Plugins go here
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'rhysd/vim-crystal'

Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-rails'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
"Plug 'cakebaker/scss-syntax.vim'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-dispatch'
Plug 'vim-ruby/vim-ruby'
"Plug 'kchmck/vim-coffee-script'
Plug 'fatih/vim-go'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
"Plug 'majutsushi/tagbar'
Plug 'junegunn/vim-easy-align'

"Plug 'kepbod/quick-scope'
"let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

"Plug 'groenewege/vim-less'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'rust-lang/rust.vim'

Plug 'airblade/vim-gitgutter'

" Deps for vim-snipmate
"Plug 'MarcWeber/vim-addon-mw-utils'
"Plug 'tomtom/tlib_vim'
"Plug 'garbas/vim-snipmate'
"Plug 'honza/vim-snippets'

Plug 'tpope/vim-endwise'

" ar | ir support for ruby
" var - outer block
" vir - inner block
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'

" vim: ciw | yiw | vat | di"
" targets: ci* | va| | ci_ | da,
Plug 'wellle/targets.vim'

" vii - inner indention
" vaI - inner + outer 1 level
Plug 'michaeljsmith/vim-indent-object'

" doesn't make f and F suck
Plug 'rhysd/clever-f.vim'

" wordmotion with snake-case and camel case
Plug 'chaoren/vim-wordmotion'

"Plug 'Yggdroot/indentLine'
"let g:indentLine_faster = 1
"let g:indentLine_setConceal = 1

"Plug 'mhinz/vim-grepper'

" [q and ]q for quickfix
"Plug 'tpope/vim-unimpaired'

Plug 'rakr/vim-one'
Plug 'jpo/vim-railscasts-theme'

"Plug 'neomake/neomake'
"Plug 'itchyny/lightline.vim'

" Theme
"Plugin 'w0ng/vim-hybrid'

call plug#end()

set updatetime=300

"noremap <leader>gr :GrepperRg<Space>
"nnoremap <leader>g :Grepper -tool git<cr>
"nnoremap <leader>G :Grepper -tool ag<cr>
"nnoremap <leader>* :Grepper -tool ag -cword -noprompt<cr>

" gsW | gsiW | gsi"
"nmap gs <plug>(GrepperOperator)
"xmap gs <plug>(GrepperOperator)

"nnoremap <leader>gg :Grepper -tool git<cr>
"nnoremap <leader>ga :Grepper -tool ag<cr>
"nnoremap <leader>gs :Grepper -tool ag -side<cr>
"nnoremap <leader>*  :Grepper -tool ag -cword -noprompt<cr>

"let g:grepper = {}
"runtime autoload/grepper.vim
"let g:grepper.tools         = ['ag', 'rg']
"let g:grepper.jump = 1
"let g:grepper.switch = 0
"let g:grepper.stop = 100
"nnoremap <leader>g :Grepper -tool rg<cr>
"nnoremap <leader>G :Grepper -tool rg -buffers<cr>
"nnoremap <leader>* :Grepper -tool ag -cword -noprompt<cr>

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
let g:neomake_java_enabled_makers = []
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

"augroup lint_events
  "autocmd!
  "autocmd BufWritePost * call Lint()
"augroup end

"let g:gitgutter_enabled = 1
highlight clear SignColumn

let g:bookmark_highlight_lines = 1
let g:bookmark_manage_per_buffer = 1

let g:buffergator_suppress_keymaps = 1
let g:buffergator_sort_regime = 'mru'
let g:buffergator_show_full_directory_path = 0

set backupdir=~/.nvim/backup/
set directory=~/.nvim/backup/
set noswapfile

set guioptions=
set guifont=Menlo\ Regular:h14"

filetype plugin indent on
syntax on

let mapleader = "\<space>"

if executable('fzf')
  " FZF {{{
  "let g:fzf_layout = { 'window': 'enew' }

  " <C-p> or <C-t> to search files
  " :Commits
  nnoremap <silent> <C-t> :Files<cr>
  nnoremap <silent> <C-p> :History<cr>
  nnoremap <silent> <C-b> :Buffers<CR>
  nnoremap <leader>r :BTags<CR>
  nnoremap <leader>t :FZF!<CR>
  " nnoremap <leader>p :History!<CR>
  nmap <leader>l :BLines<CR>
  nmap <leader>L :Lines<CR>
  nmap <leader>/ :Ag<CR>

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
":nnoremap <leader>l :ls<cr>:b<space>

" Fugitive
"nnoremap <leader>gs :Gstatus<CR>
"nnoremap <leader>gc :Gcommit -v -q<CR>
"nnoremap <leader>ga :Gcommit --amend<CR>
"nnoremap <leader>gt :Gcommit -v -q %<CR>
"nnoremap <leader>gd :Gdiff<CR>
"nnoremap <leader>ge :Gedit<CR>
"nnoremap <leader>gr :Gread<CR>
"nnoremap <leader>gw :Gwrite<CR><CR>
"nnoremap <leader>gl :silent! Glog<CR>
"nnoremap <leader>gp :Ggrep<Space>
"nnoremap <leader>gm :Gmove<Space>
"nnoremap <leader>gb :Git branch<Space>
"nnoremap <leader>go :Git checkout<Space>
"nnoremap <leader>gps :Dispatch! git push<CR>
"nnoremap <leader>gpl :Dispatch! git pull<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" should be `<C-H>', but there is in the current version of libterm that
" affects this.
"nnoremap <BS> <C-W><C-H>

nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>

"nnoremap B ^
"nnoremap E $
" $/^ doesn't do anything
"nnoremap $ <nop>
"nnoremap ^ <nop>

" Reformat whole file
"nnoremap g= gg=G``

set splitbelow
set splitright

nnoremap <leader><space> :noh<CR>

" neomake
"nmap <Leader><Space>o :lopen<CR>      " open location window
"nmap <Leader><Space>c :lclose<CR>     " close location window
"nmap <Leader><Space>, :ll<CR>         " go to current error/warning
"nmap <Leader><Space>n :lnext<CR>      " next error/warning
"nmap <Leader><Space>p :lprev<CR>      " previous error/warning

"nnoremap gf <C-W>f
"nnoremap gF gf

"autocmd Filetype *.js set nocindent

autocmd BufRead,BufNewFile *.rb setlocal ts=2 sts=2 sw=2 expandtab
autocmd BufRead,BufNewFile *.css setlocal ts=2 sts=2 sw=2
autocmd BufRead,BufNewFile *.scss setlocal ts=2 sts=2 sw=2

autocmd BufRead,BufNewFile *.js setlocal ts=2 sts=2 sw=2
"autocmd FileType javascript set tabstop=2|set shiftwidth=2|set expandtab
" Enable JSX rendering for JS files
let g:javascript_plugin_jsdoc = 1
let g:jsx_ext_required = 0

" vim-go overrides
let g:go_def_mapping_enabled=0

colorscheme railscasts
"colorscheme one
"set bg=dark

" comment color for hybrid #707880
"highlight LineNr guifg=#b294bb

nmap \\ <leader>ci
vmap \\ <leader>ci

"
" Pane bindings
"

" max height of current split
" ctrl + w _
" max width of current vsplit
" ctrl + w |
" reset splits
" ctrl + w =
"
" close every window in the current tabview but the current one
" ctrl + W o

" Use | and _ to split windows (while preserving original behaviour of [count]bar and [count]_).
" Somewhat unnecessary since <C-W>s and <C-W>v do the same things
nnoremap <expr><silent> \| !v:count ? "<C-W>v<C-W><Right>" : '\|'
nnoremap <expr><silent> _  !v:count ? "<C-W>s<C-W><Down>"  : '_'
nmap <Tab> <C-W>w
nmap <S-Tab> <C-W>W
"nmap <C-Tab> >>
"nmap <C-S-Tab> <<

map <leader>, :NERDTreeToggle<CR>
map <leader>f :NERDTreeFind<CR>
map <leader>b :BuffergatorToggle<CR>
"map <leader>. :Tagbar<CR>
"map <leader>a :Ack <cword> 
map <leader>a :Ag <C-r>=expand('<cword>')<cr><cr>
"map <leader>a :Ag! "<cword>"<cr>
"nnoremap <leader>bs :cex []<BAR>bufdo vimgrepadd @@g %<BAR>cw<s-left><s-left><right>

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

set mouse=
set clipboard+=unnamedplus
noremap <silent> <leader>c :let @+ = expand("%")<CR>

set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set cursorline
set list
"set expandtab

"let g:ruby_fold = 1
"let g:ruby_foldable_groups = 'def #'

set lazyredraw
set regexpengine=0

let g:rails_projections = {
      \  "app/controllers/*_controller.rb": {
      \      "test": [
      \        "spec/requests/{}_controller_spec.rb",
      \        "spec/controllers/{}_controller_spec.rb",
      \        "test/controllers/{}_controller_test.rb"
      \      ],
      \      "alternate": [
      \        "spec/requests/{}_controller_spec.rb",
      \        "spec/controllers/{}_controller_spec.rb",
      \        "test/controllers/{}_controller_test.rb"
      \      ],
      \   },
      \   "spec/requests/*_controller_spec.rb": {
      \      "command": "request",
      \      "alternate": "app/controllers/{}_controller.rb",
      \      "template": "require 'rails_helper'\n\n" .
      \        "RSpec.describe '{}' do\nend",
      \   },
      \   "spec/requests/*_spec.rb": {
      \      "command": "request",
      \      "alternate": "app/controllers/{}_controller.rb",
      \      "template": "require 'rails_helper'\n\n" .
      \        "RSpec.describe '{}' do\nend",
      \   },
      \ }
