local M = {
    "nvim-treesitter/nvim-treesitter",
    config = function()
                local configs = require("nvim-treesitter.configs")

                configs.setup({
                    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "python", "javascript", "html", "css", "latex","typst" },
                    sync_install = false,
                    auto_install = true,
                    highlight = { enable = true },
                    indent = { enable = true },  
                })
    end;
}

return { M }
