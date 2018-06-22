" dein.vim
"   https://github.com/Shougo/dein.vim
" インストール
" :call dein#install()

if &compatible
 set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
set runtimepath+=~/.cache/dein/repos/github.com/editorconfig/editorconfig-vim

if dein#load_state('~/.cache/dein')
 call dein#begin('~/.cache/dein')

 call dein#add('~/.cache/dein')
 call dein#add('Shougo/deoplete.nvim')
 if !has('nvim')
   call dein#add('roxma/nvim-yarp')
   call dein#add('roxma/vim-hug-neovim-rpc')
 endif

 " 自動補完
 call dein#add('Shougo/neocomplcache')

 " colorscheme
 call dein#add('jacoborus/tender.vim')
 call dein#add('romainl/Apprentice')
 call dein#add('freeo/vim-kalisi')
 call dein#add('tomasr/molokai')

 " editorconfig
 call dein#add('editorconfig/editorconfig-vim')

 " Javascript
 call dein#add('pangloss/vim-javascript')

 " Typescript
 call dein#add('leafgarland/typescript-vim')

 call dein#end()
 call dein#save_state()
endif

filetype plugin indent on

"--------------------------------------------------
"  文字コード
"--------------------------------------------------
set encoding=utf-8
set fileencoding=utf-8

"--------------------------------------------------
" 基本設定
"--------------------------------------------------
syntax enable
set synmaxcol=500                  " syntaxで解析するのは1行あたり500文字まで
set showcmd                        " コマンドをステータス業に表示
set showmode                       " 現在のモードを表示
set nobackup                       " バックアップを取らない
set number                         " 行番号を表示
set showmatch                      " 括弧の対応をハイライト
set matchpairs& matchpairs+=<:>    " 括弧の対応に"<", ">" を追加
set cursorline                     " カーソル行をハイライト
set wrapscan                       " 最後まで検索したら最初に戻る
set smartcase                      " 検索文字列に大文字が含まれている場合は区別して検索する
set incsearch                      " インクリメンタルサーチ
set hlsearch                       " 検索文字列をハイライト
set autoindent                     " 自動でインデント
set smartindent                    " 新しい行を開始した時に新しい行のインデントを現在行と同じにする
set cindent                        " Cプログラムファイルの自動インデントを始める
set wildmenu                       " コマンドラインモード時にタブで補完候補を表示
set shiftwidth=4                   " 自動的に挿入されるインデントの幅
set tabstop=4                      " ファイルの中のタブをスペース何個分で表示するか
set backspace=indent,eol,start

"let g:netrw_liststyle = 3

nmap X diw

"--------------------------------------------------
" 色
"--------------------------------------------------
if (has("termguicolors"))
  set termguicolors
endif

"let g:molokai_original = 1
colorscheme molokai

"--------------------------------------------------
" ファイルタイプ
"--------------------------------------------------
let g:EditorConfig_python_files_dir = '~/.cache/dein/repos/github.com/editorconfig/editorconfig-vim/plugin/editorconfig-core-py'

au BUfNewFile,BufRead *.php    set expandtab tabstop=4 shiftwidth=4
au BUfNewFile,BufRead *.py     set expandtab tabstop=4 shiftwidth=4
au BUfNewFile,BufRead *.groovy set expandtab tabstop=4 shiftwidth=4
au BUfNewFile,BufRead *.yaml   set expandtab tabstop=2 shiftwidth=2
au BUfNewFile,BufRead *.sh     set expandtab tabstop=2 shiftwidth=2
au BUfNewFile,BufRead *.html   set expandtab tabstop=2 shiftwidth=2
au BUfNewFile,BufRead *.js     set expandtab tabstop=2 shiftwidth=2
au BUfNewFile,BufRead *.css    set expandtab tabstop=2 shiftwidth=2
au BUfNewFile,BufRead *.json5  set expandtab tabstop=2 shiftwidth=2

"--------------------------------------------------
" 前回の位置を記憶させる
"--------------------------------------------------
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"--------------------------------------------------
" 入力補完
" https://github.com/Shougo/neocomplcache.vim
"--------------------------------------------------
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

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
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_force_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

