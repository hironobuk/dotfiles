" Vim fallback configuration.
" Neovim uses ~/.config/nvim/init.lua instead of this file.

set nocompatible
filetype plugin indent on
syntax enable

" Keep the shared editing behavior aligned with the Neovim configuration.
set number
set showmatch
set matchpairs& matchpairs+=<:>
set cursorline
set smartcase
set shiftwidth=4
set tabstop=4
set mouse=
set synmaxcol=500
set redrawtime=10000

if exists('+inccommand')
  set inccommand=split
endif

if exists('+termguicolors')
  set termguicolors
endif

" Use Vim's built-in insert completion.
if exists('+autocomplete')
  set autocomplete
  set completeopt=menu,popup,noselect
else
  set completeopt=menu,noselect
endif

function! s:has_text_before_cursor() abort
  let l:col = col('.') - 1
  return l:col > 0 && getline('.')[l:col - 1] !~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>has_text_before_cursor() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <CR> pumvisible() ? "\<C-e>\<CR>" : "\<CR>"

" X deletes the word under the cursor.
nnoremap X diw

augroup FiletypeIndent
  autocmd!
  autocmd FileType php,python,groovy
        \ setlocal expandtab tabstop=4 shiftwidth=4
  autocmd FileType yaml,sh,html,javascript,css
        \ setlocal expandtab tabstop=2 shiftwidth=2
augroup END

augroup CustomFiletypes
  autocmd!
  autocmd BufNewFile,BufRead *.ect setfiletype html
augroup END

" Restore the cursor position when reopening a file.
augroup RestoreCursor
  autocmd!
  autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line('$') |
        \   execute "normal! g`\"" |
        \ endif
augroup END

" Use molokai when it has been installed separately for Vim.
let g:molokai_original = 1
silent! colorscheme molokai

highlight DiffText gui=bold cterm=bold
highlight Macro gui=NONE cterm=NONE
highlight SpecialKey gui=NONE cterm=NONE
highlight Special gui=NONE cterm=NONE
highlight StorageClass gui=NONE cterm=NONE
highlight Tag gui=NONE cterm=NONE
highlight CursorLine gui=underline cterm=underline
