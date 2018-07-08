set nocompatible
filetype off

call plug#begin('~/.vim/plugged')
Plug 'vim-scripts/sudo.vim'
Plug 'tpope/vim-rails'
Plug 'Shougo/unite.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-haml'
Plug 'cakebaker/scss-syntax.vim'
Plug 'Shougo/neocomplcache'
Plug 'ujihisa/unite-colorscheme'
Plug 'tsukkee/unite-help'
Plug 'Shougo/unite-outline'
Plug 'sgur/unite-git_grep'
Plug 'negipo/unite-rails'
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
set lcs=tab:-_,trail:_

colorscheme base16-bright
highlight Pmenu ctermbg=0
highlight PmenuSel ctermbg=5

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

function! RunSpecL()
  let file_path = expand("%:p")
  let line_number = line(".")
  execute  ":! " . "bundle exec rspec " . file_path . " -l " . line_number . " -X "
  unlet line_number
  unlet file_path
endfunction
nmap gws :call RunSpecL()<CR>

function! RunSpec()
  let file_path = expand("%:p")
  let line_number = line(".")
  execute  ":! " . "bundle exec rspec " . file_path . " -X "
  unlet line_number
  unlet file_path
endfunction
nmap gwa :call RunSpec()<CR>

function! GitGrep(arg)
  let gtmp = &grepprg
  let &grepprg = 'git grep -n'
  silent execute ':grep '.a:arg
  let &grepprg = gtmp
  silent cwin
endfunction
command! -nargs=1 -complete=tag GitGrep call GitGrep(<q-args>)
nnoremap <unique> gG :exec ':GitGrep ' . expand('<cword>')<CR>

if filereadable(expand('~/.vimrc.plugin'))
  source ~/.vimrc.plugin
endif

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif
