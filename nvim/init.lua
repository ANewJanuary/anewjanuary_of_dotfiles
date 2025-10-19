require("config")
require("config.lazy")
-- treesitter stuff
require("lazy").setup({
  {"nvim-treesitter/nvim-treesitter", branch = 'main', lazy = false, build = ":TSUpdate"}
})

vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme solarized]])
