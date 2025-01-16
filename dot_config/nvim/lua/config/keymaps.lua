-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("n", "<C-l>", "<cmd>nohlsearch<CR>")
map("n", ";", ":", { silent = false })
map("i", "<C-e>", "<Right><Right>")
