return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    layout_config = {
        vertical = { width = 0.5 }
        -- other layout configuration here
    },
    pickers = {
        find_files = {
            theme = "dropdown",
        }
    },
}
