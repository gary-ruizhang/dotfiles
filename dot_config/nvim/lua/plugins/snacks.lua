local mk = vim.g.main_key

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
      { string.format("<%s-p>", mk), function() Snacks.picker() end, desc = "All in All" },
      { "<C-q>", function() Snacks.picker.smart({ multi = { "recent", "files" }, matcher = { sort_empty = false }, filter = { cwd = false } }) end, desc = "Recent", },
      { string.format("<%s-e>", mk), function() Snacks.picker.smart({ multi = { "recent", "files" }, matcher = { sort_empty = false }, filter = { cwd = true } }) end, desc = "Recent", },
      { string.format("<%s-b>", mk), function() Snacks.picker.buffers({ current = false }) end, desc = "Buffers" },
      { string.format("<%s-S-f>", mk), function() Snacks.picker.grep({ exclude = { "**/yellow.md", "**/archive/*" } }) end, desc = "Grep" },
      { string.format("<%s-r>", mk), function() Snacks.picker.resume() end, desc = "Buffer Lines" },
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
