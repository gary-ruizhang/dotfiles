-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("n", "<C-l>", "<cmd>nohlsearch<CR>")
map("n", ";", ":", { silent = false })
map("v", ";", ":", { silent = false })
map("i", "<C-e>", "<Right><Right>")
map("n", "<M-Enter>", vim.lsp.buf.code_action, { desc = "Code Action" })
map("n", "<M-c>", "<cmd>only<CR>")
map("v", "<M-c>", '"+y')
map("i", "<C-l>", "<Esc>zzgi")
map("n", "<C-c>", function()
  -- TODO always use inside a file
  local dir = vim.fn.expand("%:p:h")
  if dir then
    -- FIXME not work for buffers
    vim.cmd({ cmd = "lcd", args = { dir } })
    vim.notify(string.format("CWD: %s", dir), vim.log.levels.INFO)
  else
    vim.notify("Cannot :cd; not in a directory", vim.log.levels.WARN)
  end
end)

-- swap with trouble.nvim
map("n", "<leader>xL", "<cmd>lopen<cr>", { desc = "Location List" })
map("n", "<leader>xQ", "<cmd>copen<cr>", { desc = "Quickfix List" })
