-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = {
  "html",
  "cssls",
  "pyright",
  "clangd",
  "ts_ls",
  "rust_analyzer",
  "texlab",
  "jsonls",
  "yamlls"
}

local nvlsp = require "nvchad.configs.lspconfig"

-- local ensure_installed = vim.tbl_keys(servers or {})
--       vim.list_extend(ensure_installed, {
--         'stylua', -- Lua formatter
--       })
-- require('mason-lspconfig').setup { ensure_installed = ensure_installed }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

local get_intelephense_license = function ()
  local f = io.open(os.getenv("HOME") .. "/intelephense/license.txt", "rb")
  if not f then
    return ""
  end
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
          '**/dist/**',     -- ← ignore any "dist" folder
          '**/.dist/**',    -- ← ignore any ".dist" folder
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
print(require('configs.espocrm.jsonschema').getEspoSchema())

lspconfig.jsonls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  settings = {
    json = {
      schemas = require('schemastore').json.schemas {
        extra = require('configs.espocrm.jsonschema').getEspoSchema(),
      },
      validate = { enable = true },
    },
  },
}
