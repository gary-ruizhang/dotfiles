-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.clipboard = ""
opt.undofile = false
opt.timeoutlen = 300
opt.conceallevel = 0
opt.wrap = true
opt.shiftround = false
opt.shiftwidth = 4
opt.tabstop = 4

local g = vim.g

g.lazyvim_picker = "snacks"
g.snacks_animate = false

-- disable lsp document highlight
LazyVim.lsp.on_attach(function(client, buffer)
  client.server_capabilities.documentHighlightProvider = false -- disable automatic under cursor word highlights
end)

vim.lsp.buf.format = {
  enabled = false, -- Disable LSP formatting globally
  -- filter = function(client) -- Alternatively, you could use filter
  --   return false           -- to disable for all clients
  -- end,
  timeout_ms = 500,
}

-- Make sure other general vim options are also set here
vim.g.autoformat = false -- Also set this just in case older configs use it
