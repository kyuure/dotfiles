return {
  "saghen/blink.cmp",
  version = "1.*",

  dependencies = {
    "rafamadriz/friendly-snippets",
    "echasnovski/mini.snippets",
  },

  opts = {
    keymap = {
      preset = "enter",
    },
    cmdline = {
      keymap = {
        preset = "super-tab",
      },
    },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "mono",
    },
    sources = {
      default = { "lazydev", "lsp", "path", "snippets", "buffer" },
      providers = {
        lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
      },
    },
    snippets = { preset = "mini_snippets" },
    fuzzy = { implementation = "lua" },
    signature = { window = { border = "single" } },
    completion = {
      menu = {
        border = "rounded",
        -- My savior: https://github.com/LazyVim/LazyVim/discussions/5056#discussioncomment-11574267
        winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
        draw = {
          columns = {
            { "label", "label_description" },
            { "kind_icon", "kind" },
          },
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 500,
        window = { border = "rounded" },
      },
    },
  },

  opts_extend = { "sources.default" },
}
