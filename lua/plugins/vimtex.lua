return {
  'lervag/vimtex',
  lazy = false,
  init = function()
    vim.g.vimtex_view_method = 'zathura'
    vim.g.vimtex_quickfix_enabled = 2
    vim.g.vimtex_view_general_viewer = 'setsid zathura'
  end,
}
