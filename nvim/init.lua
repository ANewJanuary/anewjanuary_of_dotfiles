if vim.g.vscode then
  -- VSCode extension
else

  -- ordinary Neovim
  require("config.options")
  require("config.keymaps")
  require("config.lazy")
  -- neovide options
  if vim.g.neovide then
    require("olivetti").setup({
      width = 80,
      scrolloff = 0.25,
    })
    -- some aesthetic stuff
    -- vim.g.neovide_cursor_animation_length = 0.1
    vim.g.neovide_refresh_rate = 120
    vim.g.neovide_cursor_trail_size = 0
    vim.g.neovide_scroll_animation_length = 0
    vim.g.neovide_cursor_animation_length = 0
    vim.g.neovide_cursor_animate_in_insert_mode = true
    vim.g.neovide_cursor_animate_command_line = false
    vim.g.neovide_text_gamma = 0.0
    vim.g.neovide_text_contrast = 1
    vim.o.guifont = "Cascadia Mono NF Semilight:h16" -- text below applies for VimScript
    vim.g.neovide_scale_factor = 1

    -- padding n such
    local pad = 70
    vim.g.neovide_padding_top = pad
    vim.g.neovide_padding_bottom = pad
    vim.g.neovide_padding_left = pad
    vim.g.neovide_padding_right = pad

    -- g:neovide_opacity should be 0 if you want to unify transparency of content and title bar.
    vim.g.neovide_opacity = 1
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
  end
  -- vim.cmd("colorscheme nord")
  -- vim.api.nvim_set_hl(0, "Normal", { fg = "#f5f5f5", bg = "#101418" })   
  -- vim.api.nvim_set_hl(0, "LineNr", { bg = "#101418" })   
  -- vim.api.nvim_set_hl(0, "SignColumn", { bg = "#101418" })   
  vim.api.nvim_set_hl(0, "LineNr", { bg = "#000000" })   
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "#000000" })   
  -- LSP STUFF
  vim.lsp.enable({
    -- for typst
    "tinymist",
  })
end

