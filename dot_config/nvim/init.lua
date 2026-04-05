local is_mac = vim.loop.os_uname().sysname == "Darwin"

-- 定义你的“主修饰键”
-- macOS: D (Command)
-- WSL/Linux: M (Alt/Meta)
vim.g.main_key = is_mac and "D" or "M"

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
