-- stylua: ignore
local colours = {
  black = 236,
  gray = 237,
  white = 244,
  purple = 141,
  blue = 111,
  yellow = 214,
  green = 40,
}

local palenight_modified = {
  normal = {
    a = { fg = colours.black, bg = colours.purple, gui = "bold" },
    b = { fg = colours.purple, bg = colours.gray },
    c = { fg = colours.gray, bg = colours.black },
  },
  insert = {
    a = { fg = colours.black, bg = colours.blue, gui = "bold" },
    b = { fg = colours.blue, bg = colours.gray },
  },
  visual = {
    a = { fg = colours.black, bg = colours.yellow, gui = "bold" },
    b = { fg = colours.yellow, bg = colours.gray },
  },
  replace = {
    a = { fg = colours.black, bg = colours.green, gui = "bold" },
    b = { fg = colours.green, bg = colours.gray },
  },

  inactive = {
    a = { fg = colours.white, bg = colours.black, gui = "bold" },
    b = { fg = colours.white, bg = colours.black },
    c = { fg = colours.white, bg = colours.black },
  },
}

return {
  "nvim-lualine/lualine.nvim",

  config = function()
    require("lualine").setup({
      options = {
        theme = palenight_modified, --"palenight",
        component_separators = { left = "", right = "" },
        section_separators = "",
        ignore_focus = { "NvimTree", "netrw", "fugitiveblame" },
        disabled_filetypes = {
          statusline = { "NvimTree", "netrw", "fugitiveblame", "neotest-summary" },
        },
      },

      sections = {
        lualine_a = { "mode" },
        lualine_b = {
          {
            "filename",
            shorting_target = 25,
            symbols = {
              modified = "",
              readonly = "",
              unnamed = "[No Name]",
              newfile = "",
            },
          },
        },
        lualine_c = {
          "diff",
          {
            "diagnostics",
            update_in_insert = true,
          },
        },
        lualine_x = {
          {
            "lsp_status",
            icon = "",
            symbols = {
              spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
              done = "✓",
              separator = " ",
            },
            ignore_lsp = {},
          },
        },
        lualine_y = { "filetype" },
        lualine_z = { "progress", "location" },
      },

      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          {
            "filename",
            shorting_target = 50,
            path = 1,
            symbols = {
              modified = "",
              readonly = "",
              unnamed = "[No Name]",
              newfile = "",
            },
          },
        },
        lualine_x = { "filetype" },
        lualine_y = {},
        lualine_z = {},
      },

      tabline = {
        lualine_a = {
          {
            "buffers",
            show_filename_only = false,
            show_modified_status = false,
            mode = 0,
            max_length = 15,
            filetype_names = {
              TelescopePrompt = "FZF",
              fzf = "FZF",
              NvimTree = "EXPLORER",
              netrw = "EXPLORER",
              fugitiveblame = "BLAME",
            },
          },
        },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {
          {
            "tabs",
            show_modified_status = false,
          },
        },
        lualine_z = { "branch" },
      },
    })
  end,
}
