return {
    {
      "folke/which-key.nvim",
      event = "VeryLazy",
      config = function()
        local wk = require("which-key")

        wk.setup({
          preset = "modern",
          delay = 300,
          expand = 1,
          notify = false,
        })

        wk.add({
          { "<leader>f", group = "find" },
        })
      end,
    },
}
