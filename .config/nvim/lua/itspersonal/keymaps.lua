vim.g.mapleader = " "

-- explorer
vim.keymap.set("n", "<leader>o", vim.cmd.Ex)

-- jump to the edge
vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "L", "$")
vim.keymap.set("v", "H", "^")
vim.keymap.set("v", "L", "$")

-- mark
vim.keymap.set("n", "<leader>m", "m'")

-- keybind without going into default registry
vim.keymap.set("n", "x", '"_x')
vim.keymap.set("n", "c", '"_c')
vim.keymap.set("n", "X", '"_X')
vim.keymap.set("n", "C", '"_C')
vim.keymap.set("v", "x", '"_d')
vim.keymap.set("v", "c", '"_c')
vim.keymap.set("v", "X", '"_D')
vim.keymap.set("v", "C", '"_C')

-- change window
vim.keymap.set("n", "<leader>h", "<C-w>h")
vim.keymap.set("n", "<leader>j", "<C-w>j")
vim.keymap.set("n", "<leader>k", "<C-w>k")
vim.keymap.set("n", "<leader>l", "<C-w>l")

-- split window
vim.keymap.set("n", "<leader>sl", ":vsplit<CR> <C-w>w")
vim.keymap.set("n", "<leader>sj", ":split<CR> <C-w>w")

-- tab
vim.keymap.set("n", "<leader>n", ":tabnew<CR><cmd>NvimTreeFocus<CR>")
vim.keymap.set("n", "<Tab>", "gt")
vim.keymap.set("n", "<S-Tab>", "gT")
vim.keymap.set("n", "<leader>b", ":bprev<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")

-- replace all: %s/old/new/g
vim.keymap.set("n", "<leader>ra", ":%s//g<Left><Left>")

-- folds
vim.keymap.set("n", "<leader>z}", "zfa}")
vim.keymap.set("n", "<leader>z)", "zfa)")
