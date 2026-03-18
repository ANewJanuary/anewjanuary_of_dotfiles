return {
  "pxwg/math-conceal.nvim",
  event = "VeryLazy",
  build = "make lua51",
  main = "math-conceal",
  --- @type LaTeXConcealOptions
  opts = {
    enabled = true,
    conceal = {
      "greek",
      "script",
      "math",
      "font",
      "phy",
    },
    ft = { "*.tex", "*.md", "*.typ" },
  },
}
