" Source: https://stackoverflow.com/q/5316334
"         https://vi.stackexchange.com/a/21863
"         https://coderwall.com/p/usd_cw/a-pretty-vim-foldtext-function

" enable fold
set foldenable
set foldlevelstart=99
set fcs=fold:\ ,vert:\|
"set foldtext='\ ['.repeat('\ ',strlen(string(line('$')))-strlen(string(v:foldend-v:foldstart+1))).(v:foldend-v:foldstart+1).'\ ]\ ::\ '.substitute(getline(v:foldstart),'/\\*\\\|\\*/\\\|{{{\\d\\=','','g')

" Source: https://coderwall.com/p/usd_cw/a-pretty-vim-foldtext-function
set foldtext=FoldText()
function! FoldText()
  let l:text = substitute(getline(v:foldstart), '\t', repeat(' ', &tabstop), 'g')
  let l:totalline = v:foldend - v:foldstart + 1
  let l:info = repeat(' ', strlen(string(line('$')))-strlen(string(l:totalline))) . l:totalline . '  '

  let l:textlen = strlen(substitute(l:text, ".", "x", "g"))
  let l:infolen = strlen(substitute(l:info, '.', 'x', 'g')) + 4
  let l:padding = &fdc + max([&numberwidth, strlen(line('$'))]) + 1

  let l:width = winwidth(0) - l:padding - l:textlen - l:infolen

  if l:width < 0
    return l:text[0:(l:textlen+l:width-2)] . '> :: ' . l:info
  endif
  return l:text . repeat(' ', l:width) . ' :: ' . l:info
endfunction
