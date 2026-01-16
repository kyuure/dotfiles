return {
  {
    "echasnovski/mini.snippets",
    config = function()
      local ms = require("mini.snippets")
      ms.setup({
        snippets = {
          ms.gen_loader.from_lang(),
        },
      })
    end,
  },
  {
    "echasnovski/mini.indentscope",
    opts = {
      symbol = "│",
      options = {
        indent_at_cursor = false,
      },
    },
  },
  { "echasnovski/mini.surround", version = "*" },
}
