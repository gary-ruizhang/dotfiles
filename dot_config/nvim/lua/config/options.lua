-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.clipboard = ""
opt.undofile = false
opt.timeoutlen = 300

local g = vim.g

g.lazyvim_picker = "snacks"
