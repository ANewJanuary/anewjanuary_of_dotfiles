if vim.g.vscode then
  -- VSCode extension
else
  -- bootstrap lazy.nvim, LazyVim and your plugins
  -- ordinary Neovim
  require("config.lazy")
  vim.g.neovide_text_gamma = 0.0
  vim.g.neovide_text_contrast = 1
  vim.o.guifont = "Cascadia Mono NF Semilight:h18" -- text below applies for VimScript
  vim.g.neovide_scale_factor = 0.85

  n = require("neosolarized").setup({
    comment_italics = true,
    background_set = false,
  })

  -- g:neovide_opacity should be 0 if you want to unify transparency of content and title bar.
  vim.g.neovide_opacity = 0.8
  vim.g.transparency = 1

  local change_scale_factor = function(delta)
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
  end
  vim.keymap.set("n", "<C-+>", function()
    change_scale_factor(1.25)
  end)
  vim.keymap.set("n", "<C-->", function()
    change_scale_factor(1 / 1.25)
  end)
  -- And then modify as you like
  -- for some reason some code actions get highlighted with WarningMsg and it's too much for me
  n.Group.link("WarningMsg", n.groups.Comment)
  vim.cmd("colorscheme bathory")
end
