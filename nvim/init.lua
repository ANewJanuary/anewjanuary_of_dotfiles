-- ordinary Neovim
require("config")
require("config.lazy")
-- treesitter stuff
require("lazy").setup({
    {"nvim-treesitter/nvim-treesitter", branch = 'main', lazy = false, build = ":TSUpdate"}
})

vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme solarized]])
local group = vim.api.nvim_create_augroup("VCenterCursor", { clear = true })

vim.api.nvim_create_autocmd(
    {"BufEnter", "WinEnter", "WinNew", "VimResized"},
    {
        group = group,
        pattern = {"*", "*.*"},
        command = "let &scrolloff=(winheight(win_getid())/2) - (winheight(win_getid())/4)",
    }
)
