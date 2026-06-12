-- basics
vim.g.mapleader = " "
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.smartcase = true
vim.opt.undofile = true
vim.opt.termguicolors = true
vim.opt.fillchars = { eob = " " }
-- control new window splits
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.o.winborder = "none"

-- writing goodies shoutout to nano
vim.opt.number = false
vim.opt.relativenumber = false
vim.o.conceallevel = 2
vim.opt.scrolloff = 5
vim.opt.textwidth = 65
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.formatoptions:append("t")
vim.opt.spell = true
vim.opt.spelllang = { "en_us", "de_de" }

-- space vs tabs
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.smartindent = false 
vim.opt.autoindent = true
vim.opt.smarttab = true

-- updates
vim.opt.updatetime = 100
vim.opt.signcolumn = "yes"

-- tab lines
vim.opt.showtabline = 0
vim.opt.laststatus = 0

