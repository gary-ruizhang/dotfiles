return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        actions = require("trouble.sources.snacks").actions,
        win = {
          input = {
            keys = {
              ["<Esc>"] = { "close", mode = { "n", "i" } },
              ["<c-q>"] = {
                "trouble_open",
                mode = { "n", "i" },
              },
            },
          },
        },
      },

      lazygit = {
        -- TODO remove below two line if change colortheme other than lackluster
        configure = false,
        theme_path = "/Users/ruizhang/.config/nvim/lazygit-theme.yml",
        -- theme = {
        --   selectedLineBgColor = { bg = "default" }, -- set to `default` to have no background colour
        -- },
      },

      explorer = { enabled = false },
      scroll = { enabled = false },
      terminal = { enabled = false },
      words = { enabled = false },
    },
    -- stylua: ignore
    keys = {
      { "<M-x>", function() Snacks.picker() end, desc = "All in All" },
      { "<D-p>", function() Snacks.picker() end, desc = "All in All" },
      { "<C-q>", function() Snacks.picker.smart({ multi = { "recent", "files" }, matcher = { sort_empty = false }, filter = { cwd = false } }) end, desc = "Recent", },
      { "<D-e>", function() Snacks.picker.smart({ multi = { "recent", "files" }, matcher = { sort_empty = false }, filter = { cwd = true } }) end, desc = "Recent", },
      { "<D-b>", function() Snacks.picker.buffers({ current = false }) end, desc = "Buffers" },
      { "<D-S-f>", function() Snacks.picker.grep({ exclude = { "**/yellow.md", "**/archive/*" } }) end, desc = "Grep" },
      -- FIXME 和ghostty冲突
      -- { "<D-f>", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
      { "<D-r>", function() Snacks.picker.resume() end, desc = "Buffer Lines" },
    },
  },
  {
    "folke/todo-comments.nvim",
    opts = {
      highlight = {
        multiline = false, -- enable multine todo comments
        keyword = "bg",
        pattern = [[.*<(KEYWORDS)\s*]],
      },
      search = {
        pattern = [[\b(KEYWORDS)\b]],
      },
    },
  },
}
