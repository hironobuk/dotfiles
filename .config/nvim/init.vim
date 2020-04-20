" dein.vim
"   https://github.com/Shougo/dein.vim
" インストール
" :call dein#install()

if &compatible
  set nocompatible
endif

" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/deoplete.nvim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#load_toml('~/.config/nvim/dein.toml', { 'lazy' : 0 })
  call dein#load_toml('~/.config/nvim/deinlazy.toml', { 'lazy' : 1 })

  call dein#end()
  call dein#save_state()
endif

runtime! options.rc.vim
runtime! keymap.rc.vim
