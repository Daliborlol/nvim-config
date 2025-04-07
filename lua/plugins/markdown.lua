return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
  build = function() vim.fn["mkdp#util#install"]() end,
  init = function()
    local g = vim.g
    g.mkdp_auto_start = 1
    g.mkdp_auto_close = 1
    g.mkdp_browser = '/usr/bin/brave'
    g.mkdp_echo_preview_url = 1
    g.mkdp_filetypes = { 'markdown' }
  end,
}
