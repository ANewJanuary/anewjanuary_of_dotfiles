return {
  "hedyhli/outline.nvim",
  config = function()
    -- Example mapping to toggle outline
    vim.keymap.set("n", "<leader>oo", "<cmd>Outline<CR>",
      { desc = "Toggle Outline" })

    require("outline").setup {
            outline_window = {
                position = 'left',
                relative_width = true,
                width = 25,
                auto_close = false,
                auto_jump = true
            }
    }
  end,
}
