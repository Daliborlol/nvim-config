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

local get_intelephense_license = function ()
    local f = assert(io.open(os.getenv("HOME") .. "/intelephense/license.txt", "rb"))
    local content = f:read("*a")
    f:close()
    return string.gsub(content, "%s+", "")
end
lspconfig.intelephense.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  root_dir = function ()
    return vim.loop.cwd()
  end,
  init_options = {
    licenceKey = get_intelephense_license()
  },
  capabilities = nvlsp.capabilities,
  settings = {
    intelephense = {
      files = {
        associations = {   -- glob patterns relative to workspace root
          "**/*.php",
          "**/*.phtml",
          "**/*.inc",
          "**/*.module",
          "**/*.theme",
          "**/*.install",
        },
        exclude = {
          '**/dist/**',     -- ← ignore any “dist” folder
          '**/.git/**',
          '**/node_modules/**',
          '**/vendor/**/.*/**',  -- usual extra exclusions
        },
        maxSize = 5000000
      },
      environment = {
        includePaths = {
          "/home/dalibor/programming/apertia/autocrm",
          "/home/dalibor/programming/apertia/espocrm",
          "/home/dalibor/programming/apertia/PhpSpreadsheet"
        }
      },
      diagnostics = {
        enable               = true,    -- global switch
        undefinedTypes       = true,
        undefinedFunctions   = true,
        undefinedConstants   = true,
        undefinedVariables   = true,
        duplicateSymbols     = true,
        unreachableCode      = true,
      },
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
