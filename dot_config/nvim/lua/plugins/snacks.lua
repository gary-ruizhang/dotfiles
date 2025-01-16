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
      { "<C-q>", function() Snacks.picker.recent() end, desc = "Recent" },
      { "<M-e>", function() Snacks.picker.buffers() end, desc = "Buffers" },
      { "<M-S-f>", function() Snacks.picker.grep() end, desc = "Grep" },
      -- TODO make work with key n
      { "/", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
      -- TODO not work at q:
      -- { "?", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
      -- TODO figure out a suitable shortcut for resume
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
