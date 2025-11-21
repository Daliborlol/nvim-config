local plugging = {
  'harpoon',
  'lint',
  'rust',
  'schemastore',
  'vimtex',
  'surround',
  'qf',
}

local plugins = {
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

-- Dynamically import plugins from plugging array
for _, plugin_name in ipairs(plugging) do
  table.insert(plugins, { import = "plugins.custom." .. plugin_name })
end

return plugins
