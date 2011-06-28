set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'y310/vim-rails'
Bundle 'Shougo/unite.vim'
Bundle 'tpope/vim-fugitive'

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

colorscheme desert

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

" Unite settings
" uniteウィンドウの表示位置
let g:unite_split_rule = 'botright'
"let g:unite_enable_start_insert = 1
nnoremap <silent> 'b :Unite buffer <CR>
nnoremap <silent> 'f :Unite file <CR>
nnoremap <silent> 'fr :Unite file_mru <CR>
nnoremap <silent> 'r :Unite -buffer-name=register register <CR>
nnoremap <silent> 'a :UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
"cnoremap E UniteWithBufferDir file

" neocomplcache settings
"" 起動時に有効
"let g:neocomplcache_enable_at_startup = 1
"" snippet ファイルの保存先
"let g:neocomplcache_snippets_dir='~/.vim/snippets'
"" dictionary
"let g:neocomplcache_dictionary_filetype_lists = {
"      \ 'default' : '',
"      \ 'objc' : $HOME . '/.vim/dict/objc.dict'
"      \ }
"" 日本語をキャッシュしない
"let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
"" 補完候補の数
"let g:neocomplcache_max_list = 5
"" 1番目の候補を自動選択
"let g:neocomplcache_enable_auto_select = 1
"" 辞書読み込み
"noremap  <Space>d. :<C-u>NeoComplCacheCachingDictionary<Enter>
"" <TAB> completion.
"inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
"" C-jでオムニ補完
"inoremap <expr> <C-j> &filetype == 'vim' ? "\<C-x>\<C-v>\<C-p>" : "\<C-x>\<C-o>\<C-p>"
"" C-nでneocomplcache補完
"inoremap <expr><C-n>  pumvisible() ? "\<C-n>" : "\<C-x>\<C-u>\<C-p>"
"" C-pでkeyword補完
"inoremap <expr><C-p> pumvisible() ? "\<C-p>" : "\<C-p>\<C-n>"
"" 補完候補が表示されている場合は確定。そうでない場合は改行
"inoremap <expr><CR>  pumvisible() ? neocomplcache#close_popup() : "<CR>"
"" 補完をキャンセル
"inoremap <expr><C-e>  neocomplcache#close_popup()

function! RunSpecL()
  let file_path = expand("%:p")
  let line_number = line(".")
  "execute  ":! " . "source $HOME/.rvm/scripts/rvm; bundle exec prspec " . file_path . " -l " . line_number . " -X "
  execute  ":! " . "source $HOME/.rvm/scripts/rvm; spec " . file_path . " -l " . line_number . " -X "
  unlet line_number
  unlet file_path
endfunction
nmap gws :call RunSpecL()<CR>

function! RunSpec()
  let file_path = expand("%:p")
  let line_number = line(".")
  "execute  ":! " . "source $HOME/.rvm/scripts/rvm; bundle exec prspec " . file_path . " -X "
  execute  ":! " . "source $HOME/.rvm/scripts/rvm; spec " . file_path . " -X "
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

"function StripTrailingWhitespaces()
"  %s/\s\+$//e
"  ''
"endfunction
"autocmd BufWritePre * :call StripTrailingWhitespaces()
