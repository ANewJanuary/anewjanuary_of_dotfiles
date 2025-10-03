vim.keymap.set("n", "<space>oo", function()
		vim.cmd("SymbolsOutline")
end, { desc = "Get Symbols Outline" })

vim.keymap.set('n', '<space>fg', function()
		vim.cmd("cd")
		vim.cmd("Telescope live_grep")
end, { desc = 'Telescope live grep' })

vim.keymap.set('n', '<space>ff', function()
		vim.cmd("cd")
		vim.cmd("Telescope find_files")
end, { desc = 'Telescope fuzzy find' })

vim.keymap.set('n', '<space>mp', function()
		vim.cmd("cd ~/Vshrd/Learner-Portfolio")
		vim.cmd("LivePreview start")
end, { desc = 'Live Preview start' })

vim.keymap.set('n', '<space>mc', function()
		-- vim.cmd("cd ~/Vshrd/Learner-Portfolio")
		vim.cmd("LivePreview close")
end, { desc = 'Live Preview close' })

vim.keymap.set('n', '<space>tz', function()
				vim.cmd("ZenMode")
end, { desc = "Toggle ZenMode" })

vim.keymap.set("i", "jk", "<ESC>")
