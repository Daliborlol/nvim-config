return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  -- { import = "plugins.aider" },
  { import = "plugins.vimtex" },
  -- { import = "plugins.augment" },
  { import = "plugins.surround" },
  { import = "plugins.arduino" },
  { import = "plugins.qf" },
  { import = "plugins.markdown" },
  { import = "plugins.lint" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
