return {
  "lewis6991/gitsigns.nvim",
  config = function()
    vim.cmd([[
      hi GitSignsAdd    ctermbg=237 ctermfg=156
      hi GitSignsChange ctermbg=237 ctermfg=123
      hi GitSignsDelete ctermbg=237 ctermfg=9
    ]])
  end,
}
