return {
  {
    "stevearc/oil.nvim",
    lazy = false,
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      keymaps = {
        ["q"] = { "actions.close", mode = "n" },
        ["<C-c>"] = function()
          local oil = require("oil")
          local dir = oil.get_current_dir()
          if dir then
            -- FIXME not work for buffers
            vim.cmd({ cmd = "lcd", args = { dir } })
            vim.notify(string.format("CWD: %s", dir), vim.log.levels.INFO)
          else
            vim.notify("Cannot :cd; not in a directory", vim.log.levels.WARN)
          end
        end,
      },
      view_options = {
        show_hidden = true,
      },
    },
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    keys = {
      { "-", "<CMD>Oil<CR>", desc = "Open parent directory" },
    },
  },
}
