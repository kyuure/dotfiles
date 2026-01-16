" Show coc-explorer
nmap <leader>p :CocCommand explorer <CR>
" nwtre. Show explorer on current buffer window
nmap <leader>o :Ex<CR>
" opentab and coc-explorer
nmap <leader>n :tabnew<bar> :CocCommand explorer <CR>


" auto open coc-explorer on left side
" Source: https://github.com/weirongxu/coc-explorer/issues/89#issuecomment-606374700
augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * if (winnr("$") == 1 && &filetype == '') | exe 'CocCommand explorer' | endif
augroup END


" NO LONGER WORKS ON v9.0.0; IT GOT FIXED!!; it didn't...
" an alternate solution: https://groups.google.com/g/vim_dev/c/Cw8McBH6DDM/m/-O7UhK_OAgAJ
" auto exit when netrw is the only buffer
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'netrw') | call feedkeys(":quit\<CR>:\<BS>") | endif
" auto exit when explorer is the only buffer
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | call feedkeys(":quit\<CR>:\<BS>") | endif
