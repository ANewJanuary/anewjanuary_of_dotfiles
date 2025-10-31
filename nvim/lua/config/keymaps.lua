vim.keymap.set("n", "<space>oo", function()
		vim.cmd("SymbolsOutline")
end, { desc = "Get Symbols Outline" })

vim.keymap.set('n', '<space>fg', function()
		vim.cmd("cd /home/artin/Vshrd")
		vim.cmd("Telescope live_grep theme=dropdown")
end, { desc = 'Telescope live grep' })

vim.keymap.set('n', '<space>fb', function()
		vim.cmd("cd /home/artin/Vshrd")
		vim.cmd("Telescope buffers")
end, { desc = 'Telescope buffers' })

vim.keymap.set('n', '<space>ff', function()
		vim.cmd("cd /home/artin/Vshrd")
		vim.cmd("Telescope find_files theme=dropdown")
end, { desc = 'Telescope fuzzy find' })

vim.keymap.set('n', '<space>pm', function()
		vim.cmd("cd ~/Vshrd/Learner-Portfolio")
		vim.cmd("MarkdownPreview toggle")
end, { desc = 'Live Preview start' })

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
  vim.cmd("cd ~/Vshrd/Learner-Portfolio")
  visual_selection_to_telescope('find_files') 
end, { desc = "Search for this file name" })
vim.keymap.set('v', '<C-l>g', function() 
  vim.cmd("cd ~/Vshrd/Learner-Portfolio")
  visual_selection_to_telescope('live_grep') 
end, { desc = "Search for this string in notes" })

vim.keymap.set('n', '<space>tp', function()
    vim.cmd('TypstPreviewToggle') end,
    {desc= 'Toggle Typst Preview' })

function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
vim.keymap.set("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
vim.keymap.set("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
vim.keymap.set("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)
vim.keymap.set("n", "<space>f", "<Plug>(coc-format-selected)", {silent = true})


