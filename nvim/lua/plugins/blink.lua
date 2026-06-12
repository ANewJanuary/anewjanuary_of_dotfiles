return {
  'saghen/blink.cmp',
  dependencies = {
    'saghen/blink.lib',
    -- optional: provides snippets for the snippet source
    'rafamadriz/friendly-snippets',
  },
  build = function()
    -- build the fuzzy matcher, wait up to 60 seconds
    -- you can use `gb` in `:Lazy` to rebuild the plugin as needed
    require('blink.cmp').build():wait(60000)
  end,

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
    -- 'super-tab' for mappings similar to vscode (tab to accept)
    -- 'enter' for enter to accept
    -- 'none' for no mappings
    --
    -- All presets have the following mappings:
    -- C-space: Open menu or open docs if already open
    -- C-n/C-p or Up/Down: Select next/previous item
    -- C-e: Hide menu
    -- C-k: Toggle signature help (if signature.enabled = true)
    --
    -- See :h blink-cmp-config-keymap for defining your own keymap
    keymap = {
      preset = 'default',
      -- Single command
      ['<C-n>'] = { 'select_next' },
      -- Chained commands
      ['<C-p>'] = { 'select_prev', 'fallback' },
      -- Multi-key sequences
      ['<C-x><C-o>'] = { 'show', 'fallback' },
      -- Key equivalences (for terminals that support them)
      ['<C-i>'] = { 'accept', 'snippet_forward', 'fallback' },
      ['<Tab>'] = { 'select_and_accept', 'snippet_forward', 'fallback' },
      -- Override preset key
      ['<C-y>'] = { 'select_and_accept' },
      -- Disable preset key
      ['<C-e>'] = {'hide'}, -- or {}
      -- Function calling blink.cmp method
      ['<C-Space>'] = { function(cmp) return cmp.show() end },
      ['<C-Space>'] = { 'show' }, -- This is equivalent as above
      -- Actions with parameters require functions
      ['<C-space>S'] = { function(cmp) return cmp.show({ providers = { 'snippets' } }) end },

      -- String returns - feedkeys() with 't' flag (remap enabled)
      -- User mappings take precedence over built-in behavior
      ['<C-n>'] = { 'select_next' },
      -- Here, <C-n> triggers 'select_next' command defined above
      ['<C-j>'] = { function(cmp) return '<C-n>' end },
    },
    snippets = { preset = 'luasnip' },
    completion = { 
      menu = {
        enabled = true,
        auto_show = true
      },
      documentation = { 
        auto_show = false 
      },
      ghost_text = {
        enabled = true,
        -- Show the ghost text when an item has been selected
        show_with_selection = true,
        -- Show the ghost text when no item has been selected, defaulting to the first item
        show_without_selection = false,
        -- Show the ghost text when the menu is open
        show_with_menu = true,
        -- Show the ghost text when the menu is closed
        show_without_menu = true,
      },
    },
    -- (Default) list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = { 
      
      default = { 'lsp', 'path', 'snippets', 'buffer' },
      per_filetype = {
        typst = { 'lsp', 'path' },
      },
      providers = {
        lsp = { score_offset = 100 },
        snippets = { score_offset = 80 },
        path = { score_offset = 50 },
        buffer = {
          score_offset = -10,
          fallback_for = { 'lsp' },
        },
      },
    },

    -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
    -- You may use a lua implementation instead by using `implementation = "lua"`
    -- See the fuzzy documentation for more information
    fuzzy = { implementation = "prefer_rust" }
  },
}
