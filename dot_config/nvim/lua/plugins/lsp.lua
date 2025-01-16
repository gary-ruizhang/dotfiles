return {
  {
    "neovim/nvim-lspconfig",
    opts = function()
      if LazyVim.pick.want() ~= "snacks" then
        return
      end
      local Keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- stylua: ignore
      vim.list_extend(Keys, {
        { "<M-i>", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols", has = "documentSymbol" },
      })
    end,
  },
}
