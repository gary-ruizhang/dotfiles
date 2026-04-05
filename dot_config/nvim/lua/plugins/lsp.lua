return {
  {
    "neovim/nvim-lspconfig",
    keys = {
      {
        "<D-i>",
        function()
          require("snacks").picker.lsp_symbols({ filter = require("lazyvim.config").kind_filter })
        end,
        desc = "LSP Symbols",
      },
      {
        "<D-S-i>",
        function()
          require("snacks").picker.lsp_workspace_symbols({ filter = require("lazyvim.config").kind_filter })
        end,
        desc = "LSP Workspace Symbols",
      },
    },
    opts = {
        servers = {
            pyright = { enabled = false },
            ty = { enabled = true }
        },
        inlay_hints = { enabled = false },
    }
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      indent = { enable = false },
    },
    config = function()
      vim.filetype.add({
        extension = {
          asm = "nasm",
        },
      })
    end,
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        markdown = {}, -- 将其设置为空列表即可禁用该文件类型的 linter
      },
    },
  },
}
