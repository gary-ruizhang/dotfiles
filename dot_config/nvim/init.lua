-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

local actions = require("telescope.actions")

require("telescope").setup({
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close,
      },
    },
  },
})
