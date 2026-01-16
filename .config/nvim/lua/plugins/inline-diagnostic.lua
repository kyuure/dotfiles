return {
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    priority = 1000,
    config = function()
      vim.diagnostic.config({ virtual_text = false })

      require("tiny-inline-diagnostic").setup({
        preset = "modern",
        transparent_bg = true,
        transparent_cursorline = false,

        hi = {
          error = "DiagnosticError",
          warn = "DiagnosticWarn",
          info = "DiagnosticInfo",
          hint = "DiagnosticHint",
          arrow = "NonText",
          background = "CursorLine",
          mixing_color = "Normal",
        },

        signs = {
          arrow = "    ",
          up_arrow = "    ",
        },

        options = {
          use_icons_from_diagnostic = true,
          override_open_float = false,
          softwrap = 30,
        },
      })
    end,
  },
}
