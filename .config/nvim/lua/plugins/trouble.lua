return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
  cmd = { "Trouble" },
  config = true,
  keys = {
    { "<leader>eE", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
  },
}
