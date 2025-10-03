vim.keymap.set("n", "<space>oo", function()
		vim.cmd("SymbolsOutline")
end, { desc = "Get Symbols Outline" })

vim.keymap.set('n', '<space>fg', function()
		vim.cmd("cd /home/artin/Vshrd")
		vim.cmd("Telescope live_grep theme=dropdown")
end, { desc = 'Telescope live grep' })

vim.keymap.set('n', '<space>ff', function()
		vim.cmd("cd /home/artin/Vshrd")
		vim.cmd("Telescope find_files theme=dropdown")
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

local function visual_selection_to_telescope(picker)
  vim.cmd('normal! y')
  local selection = vim.fn.getreg('"')
  selection = selection:gsub('^%s+', ''):gsub('%s+$', '')
  
  if selection ~= '' then
    require('telescope.builtin')[picker]({
      default_text = selection,
      theme = 'dropdown', 
    })
  end
end

vim.keymap.set('v', '<C-l>f', function() 
  visual_selection_to_telescope('find_files') 
end, { desc = "Search for this file name" })
vim.keymap.set('v', '<C-l>g', function() 
  visual_selection_to_telescope('live_grep') 
end, { desc = "Search for this string in notes" })
