return {
  {
    "neovim/nvim-lspconfig",
    opts = function()
      local Keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- stylua: ignore
      vim.list_extend(Keys, {
        { "<M-i>", function() Snacks.picker.lsp_symbols({ filter = LazyVim.config.kind_filter }) end, desc = "LSP Symbols", has = "documentSymbol" },
        { "<M-S-i>", function() Snacks.picker.lsp_workspace_symbols({ filter = LazyVim.config.kind_filter }) end, desc = "LSP Symbols", has = "documentSymbol" },
      })

      -- require("lspconfig").asm_lsp.setup({
      --   -- handlers = {
      --   --   ["textDocument/publishDiagnostics"] = function() end,
      --   -- },
      --   filetypes = {
      --     "asm",
      --     "nasm",
      --     "s",
      --     "S",
      --   },
      -- })
    end,
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
}
