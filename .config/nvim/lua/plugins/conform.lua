return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },

  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      go = { "goimports", "goimports-reviser", "gofmt" },
      golang = { "goimports", "goimports-reviser", "gofmt" },
      terraform = { "terraform" },
      python = { "isort", "black" },
      javascript = { "prettierd", "prettier", stop_after_first = true },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback",
    },
  },
}
