-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls", "pyright", "clangd", "ts_ls" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end
lspconfig.intelephense.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  settings = {
    intelephense = {
      environment = {
        includePaths = {
          "/home/dalibor/programming/apertia/autocrm",
          "/home/dalibor/programming/apertia/espocrm",
          "/home/dalibor/programming/apertia/PhpSpreadsheet"
        }
      }
    }
  }
}

lspconfig.arduino_language_server.setup {
  cmd = {
    "arduino-language-server",
    "-fqbn", "arduino:avr:uno", -- adjust for your board
    "-cli", "arduino-cli", -- path to arduino-cli if not in PATH
  }
}
-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
