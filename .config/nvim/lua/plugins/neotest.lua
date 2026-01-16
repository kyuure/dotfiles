return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "fredrikaverpil/neotest-golang",
    "leoluz/nvim-dap-go",
  },

  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-golang")({
          dap = { justMyCode = false },
        }),
      },
    })

    vim.keymap.set("n", "<leader>tt", function()
      require("neotest").summary.toggle()
    end, { desc = "Debug: Summary Toggle" })
    vim.keymap.set("n", "<leader>tr", function()
      require("neotest").run.run({
        suite = false,
        testify = true,
      })
    end, { desc = "Debug: Running Nearest Test" })
  end,
}
