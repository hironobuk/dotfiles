"--------------------------------------------------
"  文字コード
"--------------------------------------------------
set encoding=utf-8
set fileencoding=utf-8

"--------------------------------------------------
" 基本設定
"--------------------------------------------------
filetype plugin indent on
syntax enable
set synmaxcol=500                  " syntaxで解析するのは1行あたり500文字まで
set redrawtime=10000               " 重いファイルを開いてもなるべくシンタックスハイライトが効くようにする
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
set inccommand=split
set autoindent                     " 自動でインデント
set smartindent                    " 新しい行を開始した時に新しい行のインデントを現在行と同じにする
set cindent                        " Cプログラムファイルの自動インデントを始める
set wildmenu                       " コマンドラインモード時にタブで補完候補を表示
set shiftwidth=4                   " 自動的に挿入されるインデントの幅
set tabstop=4                      " ファイルの中のタブをスペース何個分で表示するか
set backspace=indent,eol,start
set mouse=

"let g:netrw_liststyle = 3

"--------------------------------------------------
" ファイルタイプ
"--------------------------------------------------
let g:EditorConfig_python_files_dir = '~/.cache/dein/repos/github.com/editorconfig/editorconfig-vim/plugin/editorconfig-core-py'

au BUfNewFile,BufRead *.php    set expandtab tabstop=4 shiftwidth=4
au BUfNewFile,BufRead *.py     set expandtab tabstop=4 shiftwidth=4
au BUfNewFile,BufRead *.groovy set expandtab tabstop=4 shiftwidth=4
au BUfNewFile,BufRead *.yaml   set expandtab tabstop=2 shiftwidth=2
au BUfNewFile,BufRead *.yml    set expandtab tabstop=2 shiftwidth=2
au BUfNewFile,BufRead *.sh     set expandtab tabstop=2 shiftwidth=2
au BUfNewFile,BufRead *.html   set expandtab tabstop=2 shiftwidth=2
au BUfNewFile,BufRead *.js     set expandtab tabstop=2 shiftwidth=2
au BUfNewFile,BufRead *.css    set expandtab tabstop=2 shiftwidth=2
au BUfNewFile,BufRead *.ect    set expandtab tabstop=2 shiftwidth=2 filetype=html

"--------------------------------------------------
" 前回の位置を記憶させる
"--------------------------------------------------
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

