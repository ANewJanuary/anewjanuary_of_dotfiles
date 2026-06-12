-- Using lazy.nvim
return {
  "metalelf0/black-metal-theme-neovim",
  lazy = false,
  priority = 1000,
  config = function()
    require("black-metal").setup({
      -- | burzum | dark-funeral | darkthrone | emperor | gorgoroth 
      -- | immortal | impaled-nazarene | khold | marduk | mayhem 
      -- | nile | taake | thyrfing | venom | windir
      theme = "khold",
      variant = "dark",
      -- use lighter bg
      alt_bg = false,
      colored_docstrings = true,
      cursorline_gutter = true,
      dark_gutter = true,
      favor_treesitter_hl = true,
      plain_float = false,
      show_eob = true,
      term_colors = true,
      transparent = false,

      diagnostics = {
        darker = true, -- Darker colors for diagnostic
        undercurl = true, -- Use undercurl for diagnostics
        background = true, -- Use background color for virtual text
      },

      plugin = {
        lualine = {
          -- Bold lualine_a sections
          bold = true,
          -- Don't set section/component backgrounds. Recommended to not set
          -- section/component separators.
          plain = false,
        },
        cmp = { -- works for nvim.cmp and blink.nvim
          -- Don't highlight lsp-kind items. Only the current selection will be highlighted.
          plain = false,
          -- Reverse lsp-kind items' highlights in blink/cmp menu.
          reverse = false,
        },
      },
      colors = {
        alt = "#5f8787",
        alt_bg = "#39121b",
        bg = "#020000",
        comment = "#505050",
        constant = "#87877f",
        fg = "#c1c1c1",
        func = "#8BA5A2",
        keyword = "#999999",
        line = "#000000",
        number = "#aaaaaa",
        operator = "#9b99a3",
        property = "#c1c1c1",
        headings = "#ffffff",
        string = "#eceee3", -- first accent
        type = "#974b46", -- second accent
        visual = "#333333",
        diag_red = "#5f8787",
        diag_blue = "#999999",
        diag_yellow = "#5f8787",
        diag_green = "#6e4c4c",
      },
      -- Override highlight groups
      highlights = {
        ["@type"] = { fg = "$type", fmt = 'none' },
        ["@keyword"] = { fg = "$keyword", fmt = 'bold' },
        ["@function"] = { fg = "$func", fmt = 'italic' },
        ["@string"] = { fg = "$string", fmt = 'none' },
        ["@comment"] = { fg = "$comment", fmt = 'italic' },
        ["@constant"] = { fg = "$constant", fmt = 'none' },
        ["@markup.heading"] = {fg = "$constant", fmt = 'bold' },
        -- [] = { fg = "", fmt = '' },
        -- [] = { fg = "", fmt = '' },
        -- [] = { fg = "", fmt = '' },
        -- [] = { fg = "", fmt = '' },
        -- [] = { fg = "", fmt = '' },
        -- [] = { fg = "", fmt = '' },
      },
    })
    require("black-metal").load()
  end,
}
