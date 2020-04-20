if (has("termguicolors"))
  set termguicolors
endif

let g:molokai_original = 1
autocmd VimEnter * nested colorscheme molokai

" italicをなくす
autocmd VimEnter * highlight DiffText                                    gui=bold
autocmd VimEnter * highlight Macro                                       gui=none
autocmd VimEnter * highlight SpecialKey                                  gui=none
autocmd VimEnter * highlight Special                                     gui=none
autocmd VimEnter * highlight StorageClass                                gui=none
autocmd VimEnter * highlight Tag                                         gui=none

" カーソル行に下線を表示
autocmd VimEnter * highlight CursorLine                                  gui=underline

