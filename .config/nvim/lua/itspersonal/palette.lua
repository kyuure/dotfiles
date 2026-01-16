vim.opt.termguicolors = false
vim.opt.cursorline = true

-- My savior: https://github.com/flazz/vim-colorschemes/tree/master

-- saking muak, pake palette sendiri ck.
-- biar support 8-bit color, ga dependent to true color.
-- this is because terminal macos sucks :).
vim.cmd([[
source ~/.config/nvim/lua/itspersonal/palette/spacegray.vim

" make the background transparent
highlight Normal ctermbg=NONE guibg=NONE
]])
