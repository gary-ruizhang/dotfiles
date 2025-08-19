return {
  {
    "echasnovski/mini.surround",
    opts = {
      mappings = {
        -- classic vim-surround keymap:
        add = "ys",
        delete = "ds",
        replace = "cs",
        -- never use just not conflict with leap.nvim
        find = "",
        find_left = "",
        highlight = "",
        update_n_lines = "",
      },
    },
  },
  {
    "ggandor/leap.nvim",
    config = function()
      vim.keymap.set("n", "s", "<Plug>(leap)")
      local leap = require("leap")
      leap.opts.safe_labels = {}
      leap.opts.preview_filter = function()
        return false
      end
      leap.opts.max_phase_one_targets = 0
      vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" })
    end,
  },
  -- {
  --   "stevearc/conform.nvim",
  --   opts = {
  --     formatters_by_ft = {
  --       java = { "google-java-format" },
  --       go = { "gofmt" },
  --       -- python = { "ruff_fix", "ruff_format", "ruff_organize_imports " },
  --       rust = { "rustfmt" },
  --       -- scala = { "scalafmt" },
  --     },
  --     formatters = {
  --       ["google-java-format"] = {
  --         prepend_args = { "--aosp" },
  --       },
  --     },
  --   },
  -- },
  {
    "echasnovski/mini.ai",
    opts = {
      custom_textobjects = {
        b = false,
      },
    },
  },
}
