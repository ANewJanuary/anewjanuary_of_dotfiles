return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = function()
    require("lazy").load({ plugins = { "markdown-preview.nvim" } })
    vim.fn["mkdp#util#install"]()
  end,
  keys = {
    {
      "<leader>cp",
      ft = "markdown",
      "<cmd>MarkdownPreviewToggle<cr>",
      desc = "Markdown Preview",
    },
  },
  config = function()
    vim.cmd([[do FileType]])
    vim.g.mkdp_auto_start = 1
    vim.g.mkdp_auto_close = 0
    vim.g.mkdp_refresh_slow = 1
    -- Markdown rendering options
    vim.g.mkdp_preview_options = {
      mkit = {},
      katex = {},
      uml = {},
      maid = {},
      disable_sync_scroll = 0,
      sync_scroll_type = "middle",
      hide_yaml_meta = 1,
      sequence_diagrams = {},
      flowchart_diagrams = {},
      content_editable = false,
      disable_filename = 0,
      toc = {},
    }

    vim.g.mkdp_markdown_css = ""
    vim.g.mkdp_highlight_css = ""
    vim.g.mkdp_page_title = "「${name}」"
    vim.g.mkdp_images_path = "/home/artin/Vshrd/Vault/Index/photos/"
    vim.g.mkdp_filetypes = { "markdown" }
    vim.g.mkdp_theme = "dark"
    vim.g.mkdp_combine_preview = 1
    vim.g.mkdp_combine_preview_auto_refresh = 1
  end,
}
