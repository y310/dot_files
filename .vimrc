set nocompatible
filetype off

if has('python3')
  silent! python3 1
endif

call plug#begin('~/.vim/plugged')
Plug 'vim-scripts/sudo.vim'
Plug 'tpope/vim-rails'
Plug 'Shougo/denite.nvim'
Plug 'Shougo/neomru.vim'
Plug 'himanoa/denite-git-grep'
Plug 'y310/denite-rails'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-haml'
Plug 'cakebaker/scss-syntax.vim'
Plug 'Shougo/neocomplcache'
Plug 'kchmck/vim-coffee-script'
Plug 'pangloss/vim-javascript'
Plug 'briancollins/vim-jst'
Plug 'sophacles/vim-processing'
Plug 'plasticboy/vim-markdown'
Plug 'vim-ruby/vim-ruby'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'elixir-lang/vim-elixir'
Plug 'isRuslan/vim-es6'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'posva/vim-vue'
Plug 'fatih/vim-go'

"colorschemes
Plug 'altercation/vim-colors-solarized'
Plug 'vim-scripts/molokai'
Plug 'vim-scripts/Wombat'
Plug 'chriskempson/base16-vim'
call plug#end()

source $VIMRUNTIME/macros/matchit.vim

if $GOROOT != ''
  set rtp+=$GOROOT/misc/vim
endif

filetype plugin indent on
syntax on
set number
set nobackup
set expandtab
set autoindent
set incsearch
set hlsearch
set showcmd
set laststatus=2
set showmatch
set backspace=indent,eol,start

set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

"tabstop(ts) Tab文字を画面上で何文字に展開するか
set tabstop=2
"shiftwidth(sw) インデントの幅
set shiftwidth=2
"softtabstop(sts) Tabキーを押したときに挿入される空白の量
set softtabstop=0

"行末の空白を可視化
set list
set lcs=tab:\ \ ,trail:_

colorscheme base16-bright
"highlight Pmenu ctermbg=0
"highlight PmenuSel ctermbg=5

" 文字コードと改行コードをステータスラインに表示
set statusline=%<%F%m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

" Shift + yで行末までコピー
nnoremap Y y$
" Ctrl + o でコマンドモードでカーソル位置から改行
nmap <C-o> i<CR><Esc>
cmap <c-z> <c-r>=expand('%:p:r')<cr>

"if has('persistent_undo')
"  set undodir=~/.vimundo
"  set undofile
"endif

if filereadable(expand('~/.vimrc.plugin'))
  source ~/.vimrc.plugin
endif

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif
