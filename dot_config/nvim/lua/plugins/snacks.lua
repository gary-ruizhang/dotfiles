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

      scroll = { enabled = false },
      terminal = { enabled = false },
    },
    -- stylua: ignore
    keys = {
      { "<M-x>", function() Snacks.picker() end, desc = "All in All" },
      { "<C-q>", function() Snacks.picker.smart({ multi = { "recent", "files" }, matcher = { sort_empty = false }, filter = { cwd = false } }) end, desc = "Recent", },
      { "<M-e>", function() Snacks.picker.smart({ multi = { "recent", "files" }, matcher = { sort_empty = false }, filter = { cwd = true } }) end, desc = "Recent", },
      { "<M-b>", function() Snacks.picker.buffers({ current = false }) end, desc = "Buffers" },
      { "<M-S-f>", function() Snacks.picker.grep() end, desc = "Grep" },
      { "<M-f>", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
      { "<M-r>", function() Snacks.picker.resume() end, desc = "Buffer Lines" },
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
