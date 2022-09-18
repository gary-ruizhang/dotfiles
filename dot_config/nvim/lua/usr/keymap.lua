-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --

-- FIXME colon not show immediately after press if no further typing
keymap("n", ";", ":", opts)
keymap("n", "Y", "y$", opts)

-- Better scroll
keymap("n", "<C-j>", "4j", opts)
keymap("n", "<C-k>", "4k", opts)
keymap("n", "<C-d>", "9j", opts)
keymap("n", "<C-u>", "9k", opts)
-- FIXME disable recording feature
keymap("n", "q", "", opts)

-- Insert --
-- Better movement
keymap("i", "<C-a>", "<ESC>I", opts)
keymap("i", "<C-e>", "<ESC>A", opts)


-- Better paste
keymap("v", "p", '"_dP', opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Plugins --

-- Telescope builtin
-- Karabiner remap <shift><shift> -> <C-c>
keymap("n", "<C-c>", "<cmd>Telescope builtin<CR>", opts)

-- Hop easymotion
keymap("n", "s", "<cmd>HopChar2<CR>", opts)
