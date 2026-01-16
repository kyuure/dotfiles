-- term color
vim.opt.termguicolors = true

-- converts tabs to spaces
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.smarttab = true
-- sets tab size to 2 whitespaces
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- replace default chars
vim.opt.list = true
vim.opt.listchars = "tab:» ,trail:·,extends:>,precedes:<" --,space:·,eol:↵,nbsp:%,trail:•"

-- highlights searches
vim.opt.hlsearch = true
-- does searches incremenentaly
vim.opt.incsearch = true
-- case-insensitive
vim.opt.ignorecase = true

-- scroll when i'm 5 away from the edge
vim.opt.scrolloff = 5

-- so that backspace works like it used to be
vim.opt.backspace = "indent,eol,start"

-- make one line exactly one line
vim.opt.wrap = false

-- sets the line numbering
vim.opt.nu = true
vim.opt.relativenumber = false
vim.opt.signcolumn = "number"
-- set edge for maxlength
vim.opt.colorcolumn = "80,120"

-- format to unix
vim.api.nvim_set_option("fileformat", "unix")
-- encoding
vim.api.nvim_set_option("encoding", "UTF-8")

-- default clipboard and multi-platform
vim.api.nvim_set_option("clipboard", "unnamed,unnamedplus")

-- new backup place
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = "/tmp/.nvim/undodir"
-- vim.opt.undodir = os.getenv("HOME") .. "/.config/nvim/undodir"
vim.opt.undofile = true

-- having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.
vim.opt.updatetime = 80

-- disable provider
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
