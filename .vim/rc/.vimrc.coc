" Completion vimrc
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
"inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" GoTo code navigation.
nmap <leader>cd <Plug>(coc-definition)
nmap <leader>ct <Plug>(coc-type-definition)
nmap <leader>ci <Plug>(coc-implementation)
nmap <leader>cr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  endif
endfunction

" Use D to show diagnostics in preview window.
nnoremap <silent> E :call ShowDiagnostic()<CR>
function! ShowDiagnostic()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('diagnosticInfo')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
highlight CocHighlightText ctermbg=Black
"cterm=NONE

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <leader>ce  :<C-u>CocList diagnostics<cr>
" Find symbol of current document.
"nnoremap <silent><nowait> <leader>co  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <leader>cs  :<C-u>CocList -I symbols<cr>
