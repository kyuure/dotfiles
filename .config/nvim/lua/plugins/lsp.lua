return {
  {
    "folke/lazydev.nvim",
    ft = "lua",

    opts = {
      library = {
        "~/.config/nvim",
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "saghen/blink.cmp",
      "mason.nvim",
      { "mason-org/mason-lspconfig.nvim", config = function() end },
    },

    opts = {
      diagnostics = { virtual_text = false },
      servers = {
        lua_ls = {},
        elixirls = {},
        gopls = {},
        terraformls = {},
        jdtls = {},
        jedi_language_server = {},
        pyright = {},
      },
    },

    config = function(_, opts)
      local lsc = require("lspconfig")
      for server, config in pairs(opts.servers) do
        config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
        lsc[server].setup(config)
      end

      vim.diagnostic.config({
        float = {
          focusable = false,
          style = "minimal",
          border = "rounded",
          source = true,
          header = "",
          prefix = "",
        },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "󰅚",
            [vim.diagnostic.severity.WARN] = "󰀪",
            [vim.diagnostic.severity.HINT] = "󰌶",
            [vim.diagnostic.severity.INFO] = "󰋽",
          },
        },
      })

      vim.keymap.set("n", "<leader>ee", vim.diagnostic.open_float)
      vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
      -- vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })

      vim.diagnostic.config({ virtual_text = true })
    end,
  },
}
