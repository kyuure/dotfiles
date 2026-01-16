print("Hi! :D")

require("itspersonal.keymaps")
require("itspersonal.options")
require("itspersonal.fold")
require("itspersonal.palette")
require("itspersonal.tree")

-- make sure lazy exists, ran only once i think
-- bootsrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- lazy setup
require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  checker = {
    enabled = false,
    notify = true,
  },
})
