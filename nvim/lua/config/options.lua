-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.number = false
vim.opt.relativenumber = false

vim.g.have_nerd_font = true
vim.o.clipboard = "unnamedplus"
vim.o.undofile = true
vim.o.updatetime = 250
vim.o.cursorline = true

vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.ruler = true
vim.opt.breakindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = "yes"
vim.opt.laststatus = 0
vim.opt.textwidth = 65
vim.opt.spelllang = { "en_us", "de_de" }
