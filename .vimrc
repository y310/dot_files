set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'y310/vim-rails'
Bundle 'Shougo/unite.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'mattn/gist-vim'
Bundle 'Shougo/neocomplcache'
Bundle 'ujihisa/unite-colorscheme'
Bundle 'tsukkee/unite-help'
Bundle 'h1mesuke/unite-outline'
Bundle 'sgur/unite-git_grep'
Bundle 'y310/unite-rails'

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

" Unite settings
" uniteウィンドウの表示位置
" let g:unite_split_rule = 'botright'
"let g:unite_enable_start_insert = 1
nnoremap <silent> 'b :Unite buffer<CR>
nnoremap <silent> 'f :Unite file -start-insert<CR>
nnoremap <silent> 'fr :Unite file_mru -start-insert<CR>
nnoremap <silent> 'r :Unite -buffer-name=register register<CR>
nnoremap <silent> 'd :UniteWithBufferDir file -buffer-name=files<CR>
nnoremap <silent> 'a :UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap <silent> 'cs :Unite colorscheme -auto-preview<CR>
nnoremap <silent> 'rm :Unite rails/model -start-insert<CR>
nnoremap <silent> 'rc :Unite rails/controller -start-insert<CR>
nnoremap <silent> 'rv :Unite rails/view -start-insert<CR>
nnoremap <silent> 'rh :Unite rails/helper -start-insert<CR>
nnoremap <silent> 're :Unite rails/extensions -start-insert<CR>
nnoremap <silent> 'rb :Unite rails/bundled_gem<CR>
nnoremap <silent> 'o :Unite outline -vertical -winwidth=50<CR>
nnoremap <silent> 'gg :Unite vcs_grep<CR>
nnoremap <silent> 'h :Unite help<CR>
nnoremap <silent> / :Unite line -start-insert<CR>

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
\ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

"Unite rails execute command
let g:unite_rails_execute_cmd = '!'

function! RunSpecL()
  let file_path = expand("%:p")
  let line_number = line(".")
  execute  ":! " . "source $HOME/.rvm/scripts/rvm; bundle exec rspec " . file_path . " -l " . line_number . " -X "
  unlet line_number
  unlet file_path
endfunction
nmap gws :call RunSpecL()<CR>

function! RunSpec()
  let file_path = expand("%:p")
  let line_number = line(".")
  execute  ":! " . "source $HOME/.rvm/scripts/rvm; bundle exec rspec " . file_path . " -X "
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
