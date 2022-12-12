syntax enable

augroup black_on_save
  autocmd!
  autocmd BufWritePre *.py Black
augroup end


inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
