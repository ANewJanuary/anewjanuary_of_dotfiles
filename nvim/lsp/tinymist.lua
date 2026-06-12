vim.api.nvim_create_autocmd('FileType', {
  pattern = 'typst',
  callback = function()
    vim.opt_local.iskeyword:append('@-@')
  end,
})

return {
  cmd = { "tinymist" },
  filetypes = { "typst" },
  root_markers = { "typst.toml" },
  on_attach = function(client, bufnr)
    vim.bo[bufnr].iskeyword = vim.bo[bufnr].iskeyword .. ',@-@'
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr, desc = 'Goto definition' })
    vim.keymap.set('n', 'grr', vim.lsp.buf.references, { buffer = bufnr, desc = 'Goto references' })
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr, desc = 'Hover' })
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = bufnr, desc = 'Goto declaration' })
    vim.api.nvim_create_autocmd('TextChangedI', {
      buffer = bufnr,
      callback = function()
        local line = vim.api.nvim_get_current_line()
        local col = vim.api.nvim_win_get_cursor(0)[2]
        local before = line:sub(1, col)
        if before:match('@%w*$') then
          require('blink.cmp').show({ providers = { 'lsp' } })
        end
      end,
    })

    local root = vim.fs.root(bufnr, { 'typst.toml', '.git' })
    if root then
      vim.lsp.buf_request(bufnr, 'workspace/executeCommand', {
        command = 'tinymist.pinMain',
        arguments = { root .. '/master.typ' },
      })
    end
  end,
  settings = {}
}
