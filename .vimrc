set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'sudo.vim'
Bundle 'tpope/vim-rails'
Bundle 'Shougo/unite.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'Shougo/neocomplcache'
Bundle 'ujihisa/unite-colorscheme'
Bundle 'tsukkee/unite-help'
Bundle 'Shougo/unite-outline'
Bundle 'sgur/unite-git_grep'
Bundle 'negipo/unite-rails'
Bundle 'kchmck/vim-coffee-script'
Bundle 'pangloss/vim-javascript'
Bundle 'briancollins/vim-jst'
Bundle 'sophacles/vim-processing'
Bundle 'plasticboy/vim-markdown'

"colorschemes
Bundle 'altercation/vim-colors-solarized'
Bundle 'molokai'
Bundle 'Wombat'

source $VIMRUNTIME/macros/matchit.vim

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

"tabstop(ts) Tab文字を画面上で何文字に展開するか
set tabstop=2
"shiftwidth(sw) インデントの幅
set shiftwidth=2
"softtabstop(sts) Tabキーを押したときに挿入される空白の量
set softtabstop=0

"行末の空白を可視化
set list
set lcs=tab:-_,trail:_

colorscheme desert
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
