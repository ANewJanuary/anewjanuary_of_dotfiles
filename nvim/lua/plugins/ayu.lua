return {
  "Shatur/neovim-ayu",
  config = function()
    require("ayu").setup({
      mirage = false,
      overrides = function()
        return { NormalNC = { bg = "#050707", fg = "#808080" } }
      end,
    })
  end,
}
