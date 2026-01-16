return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,

  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    require("nvim-tree").setup({
      on_attach = function(bufnr)
        local api = require("nvim-tree.api")

        local function opts(desc)
          return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end
        api.config.mappings.default_on_attach(bufnr)

        vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
        vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
        -- vim.keymap.del("n", "s")
      end,
      hijack_cursor = true,
      update_focused_file = {
        enable = true,
      },
      filters = {
        dotfiles = false,
        git_ignored = false,
        custom = {
          "^.git$",
        },
      },
    })

    vim.keymap.set("n", "<leader>p", "<cmd>NvimTreeFindFileToggle<CR>")
  end,
}
