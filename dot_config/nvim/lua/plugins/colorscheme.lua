return {
  -- {
  --   "slugbyte/lackluster.nvim",
  --   config = function()
  --     -- Require the plugin
  --     local lackluster = require("lackluster")
  --
  --     -- Call setup with your configuration
  --     lackluster.setup({
  --       -- Your tweaks go here
  --       tweak_syntax = {
  --         -- comment = "#808080",
  --         comment = "#777777",
  --         -- Add any other syntax tweaks from the lackluster documentation
  --         -- keyword = lackluster.color.red,
  --         -- string = lackluster.color.green,
  --         -- etc...
  --       },
  --       -- You can also configure other lackluster options here, like background transparency
  --       -- transparent_background = true,
  --     })
  --   end,
  -- },
  {
    "zenbones-theme/zenbones.nvim",
    dependencies = "rktjmp/lush.nvim",
  },
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "lackluster-hack",
      colorscheme = "zenwritten",
    },
  },
}
