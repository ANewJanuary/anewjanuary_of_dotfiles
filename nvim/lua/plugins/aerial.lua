return {
  "stevearc/aerial.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader>so", "<cmd>AerialToggle float<CR>", desc = "Toggle Outline" },
  },
  opts = {
    backends = { "treesitter", "lsp", "markdown", "man" },

    layout = {
      default_direction = "float",
      min_width = 30,
      max_width = { 50, 0.3 },
    },

    -- Close when you jump to a symbol
    close_on_select = true,

    -- Sync cursor position with the source buffer
    highlight_on_hover = true,

    nav = {
      max_height = 0.7,
      min_height = { 10, 0.1 },
      max_width  = 0.4,
      min_width  = { 0.2, 20 },
      win_opts = {
        cursorline = true,
        winblend   = 10,
      },
      autojump = false,   -- jump to symbol as cursor moves in the float
      preview  = true,
    },

    on_attach = function(bufnr)
      -- navigate symbols with [ and ]
      vim.keymap.set("n", "[s", "<cmd>AerialPrev<CR>", { buffer = bufnr, desc = "Prev symbol" })
      vim.keymap.set("n", "]s", "<cmd>AerialNext<CR>", { buffer = bufnr, desc = "Next symbol" })
    end,
  },
}
