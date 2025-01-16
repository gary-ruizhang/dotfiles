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
        find = "gsf",
        find_left = "gsF",
        highlight = "gsh",
        update_n_lines = "gsn",
      },
    },
  },
}
