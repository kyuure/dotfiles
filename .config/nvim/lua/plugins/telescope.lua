return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",

  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },

  config = function()
    require("telescope").setup({
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
        },
      },
      defaults = {
        layout_strategy = "vertical",
        sorting_strategy = "ascending",
      },
    })

    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>/f", builtin.find_files)
    vim.keymap.set("n", "<leader>/g", builtin.git_files)
    vim.keymap.set("n", "<leader>/w", builtin.live_grep)

    vim.keymap.set("n", "gd", builtin.lsp_definitions)

    vim.keymap.set("n", "<leader>?n", "<cmd>Telescope notify<cr>")
  end,
}
