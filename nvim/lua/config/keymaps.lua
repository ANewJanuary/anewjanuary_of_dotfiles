-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.del("n", "<leader>n")

vim.keymap.set("n", "<leader>hn", function()
  Snacks.picker.notifications()
end, { desc = "Notification History" })

vim.keymap.set("n", "<leader>fd", function()
  vim.cmd("lua Snacks.dashboard()")
end, { desc = "Go to Dashboard" })

vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("n", "<M-q>", "gwip")
vim.keymap.set("i", "<M-q>", "<ESC>gwipA")

vim.keymap.set("n", "<leader>tmo", function()
  vim.cmd("PeekOpen")
end, { desc = "Open Peek" })

vim.keymap.set("n", "<leader>tmc", function()
  vim.cmd("PeekClose")
end, { desc = "Close Peek" })

vim.keymap.set("n", "<leader>tp", function()
  vim.cmd("TypstPreviewToggle")
end, { desc = "Toggle Typst Preview" })

-- ZK-NVIM SECTION

vim.keymap.set("n", "<leader>nss", function()
  vim.cmd("ZkNotes")
end, { desc = "ZK Search Notes by Title" })

vim.keymap.set("n", "<leader>nst", function()
  vim.cmd("ZkTags")
end, { desc = "ZK Search Notes by Tag" })

vim.keymap.set("n", "<leader>nb", function()
  vim.cmd("ZkBuffers")
end, { desc = "List all ZK buffers" })

vim.keymap.set("n", "<leader>nlb", function()
  vim.cmd("ZkBacklinks")
end, { desc = "List all backlinks for this note" })

vim.keymap.set("n", "<leader>nll", function()
  vim.cmd("ZkLinks")
end, { desc = "List all links in this note" })

vim.keymap.set("n", "<leader>ni", function()
  vim.cmd("ZkInsertLink")
end, { desc = "Insert a new Link at Cursor" })

vim.keymap.set("n", "<leader>nn", function()
  vim.cmd("ZkNew")
end, { desc = "New ZK Note" })
