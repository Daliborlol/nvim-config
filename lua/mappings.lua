require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

require('aider').setup({
  auto_manage_context = false,
  default_bindings = false,
  debug = true,
  vim = true, 
  ignore_buffers = {},

  -- only necessary if you want to change the default keybindings. <Leader>C is not a particularly good choice. It's just shown as an example.
})

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
