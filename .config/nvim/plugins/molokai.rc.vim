if (has("termguicolors"))
  set termguicolors
endif

autocmd VimEnter * nested colorscheme molokai

" italicをなくす
autocmd VimEnter * highlight DiffText                      guibg=#4C4745 gui=bold
autocmd VimEnter * highlight Macro           guifg=#C4BE89               gui=none
autocmd VimEnter * highlight SpecialKey      guifg=#66D9EF               gui=none
autocmd VimEnter * highlight Special         guifg=#66D9EF guibg=bg      gui=none
autocmd VimEnter * highlight StorageClass    guifg=#FD971F               gui=none
autocmd VimEnter * highlight Tag             guifg=#F92672               gui=none

