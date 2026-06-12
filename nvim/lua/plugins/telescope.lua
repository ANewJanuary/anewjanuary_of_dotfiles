return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("telescope").setup({
        defaults = {
          sorting_strategy = "ascending",
          file_ignore_patterns = {
            ".git/",
            ".stfolder/",
          },
          layout_config = {
            vertical = { width = 0.5 },
            prompt_position = "bottom",
          },
          pickers = {
            find_files = {
              theme = "dropdown",
            },
          },
        },
      })
    end,
  },
}
