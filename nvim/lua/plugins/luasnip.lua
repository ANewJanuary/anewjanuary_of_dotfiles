return {
  'L3MON4D3/LuaSnip',
  version = 'v2.*',
  build = 'make install_jsregexp',
  config = function()
    require('luasnip').setup({
      enable_autosnippets = true,
      store_selection_keys = '<Tab>',
      update_events = 'TextChanged,TextChangedI',
    })
    require('luasnip.loaders.from_lua').lazy_load({
      paths = vim.fn.stdpath('config') .. '/snippets',
    })
  end,
}
