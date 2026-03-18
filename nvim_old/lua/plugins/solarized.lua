return {
    'maxmx03/solarized.nvim',
    lazy = false,
    priority = 1000,
    ---@type solarized.config
    opts = {
        on_highlights = function(colors, color)
            return {
                Normal = { fg = colors.base3, bg = colors.bg }
            }
        end,
        transparent = {
            enabled = true,
            pmenu = true,
            normal = true,
            normalfloat = true,
            neotree = true,
            nvimtree = true,
            whichkey = true,
            telescope = true,
            lazy = true,
        },
        palette = 'selenized', -- solarized (default) | selenized
        variant = 'summer', -- "spring" | "summer" | "autumn" | "winter" (default)
        error_lens = {
            text = false,
            symbol = false,
        },
        styles = {
            enabled = true,
            types = {},
            functions = { bold = true },
            parameters = {},
            comments = { italic = true },
            strings = {},
            keywords = {},
            variables = {},
            constants = {},
        },
        plugins = {
            treesitter = true,
            lspconfig = true,
            navic = true,
            cmp = true,
            indentblankline = true,
            neotree = true,
            nvimtree = true,
            whichkey = true,
            dashboard = true,
            gitsigns = true,
            telescope = true,
            noice = true,
            hop = true,
            ministatusline = true,
            minitabline = true,
            ministarter = true,
            minicursorword = true,
            notify = true,
            rainbowdelimiters = true,
            bufferline = true,
            lazy = true,
            rendermarkdown = true,
            ale = true,
            coc = true,
            leap = true,
            alpha = true,
            yanky = true,
            gitgutter = true,
            mason = true,
            flash = true,
        },
    },
}
