return {
  {
    "akinsho/org-bullets.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("org-bullets").setup({
        symbols = {
          -- list symbol
          list = "▸",
          -- headlines can be a list
          -- headlines = { "◉", "○", "✿", "✸" },
          headlines = { "Ξ", "◉", "⩺", "○" },
          checkboxes = {
            half = { "", "@org.checkbox.halfchecked" },
            done = { "✓", "@org.keyword.done" },
            todo = { "˟", "@org.keyword.todo" },
          },
        },
      })
    end,
  },
}
