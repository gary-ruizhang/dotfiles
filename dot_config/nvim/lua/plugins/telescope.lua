return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<Esc>"] = function(...)
              return require("telescope.actions").close(...)
            end,
          },
        },
      },
    },
  },
}
