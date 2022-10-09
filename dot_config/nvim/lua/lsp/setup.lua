local nvim_lsp = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities(), { snippetSupport = false })

-- TODO seperate each lsp to different config files
local servers = { 'bashls', 'pyright', 'sumneko_lua', 'yamlls' }

local opts = { silent=true }

vim.keymap.set('n', 'gp', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', 'gn', vim.diagnostic.goto_next, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions

  -- local function on_list(options)
  --   vim.fn.setqflist({}, ' ', options)
  --   vim.api.nvim_command('cfirst')
  -- end

  -- local function on_list(options)
  --   vim.fn.setloclist(0, {}, ' ', options)
  --   vim.api.nvim_command('lopen')
  -- end

  local bufopts = { silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', function () vim.lsp.buf.declaration   {} end, bufopts)
  vim.keymap.set('n', 'gd', function () vim.lsp.buf.definition    {} end, bufopts)
  vim.keymap.set('n', 'g[', function () vim.lsp.buf.implementation{} end, bufopts)
  vim.keymap.set('n', 'gr', function () vim.lsp.buf.references    {} end, bufopts)

  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
end

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    capabilities = capabilities,
    on_attach = on_attach,
  }
end

-- FIXME refactor lsp config in the future
require('lspconfig').yamlls.setup {
  settings = {
    yaml = {
      schemas = {
        ["https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.18.0-standalone-strict/all.json"] = "/*.yaml",
      },
    },
  }
}

require'lspconfig'.sumneko_lua.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
