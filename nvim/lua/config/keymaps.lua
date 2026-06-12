local map = vim.keymap.set
map('i', 'jk', '<Esc>')
-- Telescope stuff
map('n', '<Leader>fr', ':Telescope oldfiles<CR>',
  { desc = "Find Recent" })
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>",
  { desc = "Find files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>",
  { desc = "Live grep" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>",
  { desc = "Help tags" })
map("n", "<leader>fk", "<cmd>Telescope keymaps<cr>",
  { desc = "Keymaps" })
map("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>",
  { desc = "Find Symbols in Document" })
map("n", "<leader>fS", "<cmd>Telescope lsp_workspace_symbols<cr>",
  { desc = "Find Symbols in Workspace" })
map('n', '<leader>tp', function()
  local root = vim.fs.root(0, { 'typst.toml', '.git' })
  if root then
    vim.lsp.buf.execute_command({
      command = 'tinymist.pinMain',
      arguments = { root .. '/master.typ' },
    })
  end
end, { desc = 'Tinymist: pin main to master.typ' })
-- Shortcuts and stuff
map("n", "<A-q>", "gwip", { desc = "wrap text" })
map("i", "<A-q>", "<Esc>gwipi", { desc = "wrap text" })
map("i", "<A-a>", "<Esc><<i", { desc = "Demote" })
map("i", "<A-d>", "<Esc>>>i", { desc = "Promote" })
map({"n","v"}, "<A-a>", "<<<Esc>", { desc = "Demote" })
map({"n","v"}, "<A-d>", ">><Esc>", { desc = "Promote" })

-- Buffer Management

-- ctrl
map("n", "<C-b>", "<cmd>b#<cr>", { desc = "Next buffer" })

-- leaders
map("n", "<leader>bb", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
map("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Buffer delete" })

-- session management
map("n", "<leader>ss", "<cmd>mksession! ~/Vshrd/config/nvim/session.vim<cr>", { desc = "Save Session" })
map("n", "<leader>sl", "<cmd>source ~/Vshrd/config/nvim/session.vim<cr>", { desc = "Load Session" })

-- Window Management
-- split
map("n", "<leader>wv", "<cmd>vsplit<cr>", { desc = "Vertical split" })
map("n", "<leader>ws", "<cmd>split<cr>", { desc = "Horizontal split" })
map("n", "<leader>wd", "<cmd>close<cr>", { desc = "Close window" })

-- Org
map("n", "<leader>aa", "<cmd>OrgAgenda<cr>", { desc = "Org agenda" })
map("n", "<leader>oc", "<cmd>OrgCapture<cr>", { desc = "Org capture" })

-- CUSTOM FUNCTIONS --
-- insert image
vim.keymap.set("n", "<leader>ip", "<cmd>PasteImage<cr>",
  { desc = "Paste image as Typst figure" })
-- toggle list or convert
function toggle_bullet_list(bullet_char)
    bullet_char = bullet_char or '-'
    local start_line, end_line
    local mode = vim.api.nvim_get_mode().mode
    local was_visual = (mode == 'v' or mode == 'V' or mode == '\22')
    if was_visual then
        local pos1 = vim.fn.getpos("v")
        local pos2 = vim.fn.getpos(".")
        start_line = math.min(pos1[2], pos2[2])
        end_line = math.max(pos1[2], pos2[2])
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), 'n', true)
    else
        start_line = vim.api.nvim_win_get_cursor(0)[1]
        end_line = start_line
    end
    local original_cursor = vim.api.nvim_win_get_cursor(0)
    local bullet_pattern = "^(%s*)[-*+]%s"
    for line_num = start_line, end_line do
        local line = vim.api.nvim_buf_get_lines(0, line_num - 1, line_num, false)[1]
        if line then
            local indent = line:match(bullet_pattern)
            if indent then
                line = line:gsub(bullet_pattern, "%1")
            else
                local current_indent = line:match("^(%s*)")
                line = current_indent .. bullet_char .. " " .. line:gsub("^%s*", "")
            end
            vim.api.nvim_buf_set_lines(0, line_num - 1, line_num, false, {line})
        end
    end
    vim.api.nvim_win_set_cursor(0, original_cursor)
end
vim.keymap.set('v', '<leader>tb', function() toggle_bullet_list('-') end, {desc = 'Toggle bullet list (-)'})
vim.keymap.set('n', '<leader>tb', function() toggle_bullet_list('-') end, {desc = 'Toggle bullet list (-)'})
vim.keymap.set('v', '<leader>t*', function() toggle_bullet_list('*') end, {desc = 'Toggle bullet list (*)'})
vim.keymap.set('n', '<leader>t*', function() toggle_bullet_list('*') end, {desc = 'Toggle bullet list (*)'})
vim.keymap.set('v', '<leader>t+', function() toggle_bullet_list('+') end, {desc = 'Toggle bullet list (+)'})
vim.keymap.set('n', '<leader>t+', function() toggle_bullet_list('+') end, {desc = 'Toggle bullet list (+)'})
