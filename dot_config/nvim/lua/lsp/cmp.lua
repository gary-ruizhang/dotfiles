local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end

local luasnip = require("luasnip")

local check_backspace = function()
  local col = vim.fn.col(".") - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

cmp.setup({
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },

  preselect = cmp.PreselectMode.None,

  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
  }, { { name = "buffer" }, { name = "path" } }),

  snippet = {
    expand = function (args)
      luasnip.lsp_expand(args.body)
    end
  },

  mapping = cmp.mapping.preset.insert({
    ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),

    ["<C-f>"] = cmp.mapping.confirm({ select = true }),

    -- ["<Tab>"] = cmp.mapping(function(fallback)
    --   -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
    --   if cmp.visible() then
    --     local entry = cmp.get_selected_entry()
    --     if not entry then
    --       cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
    --     else
    --       cmp.confirm()
    --     end
    --   else
    --     fallback()
    --   end
    -- end, {"i","s","c",}),

    ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          local entry = cmp.get_selected_entry()
          if not entry then
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
          else
            cmp.confirm()
          end
        elseif luasnip.expandable() then
          luasnip.expand()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif check_backspace() then
          fallback()
        else
          fallback()
        end
    end,
      {
        "i",
        "s",
      }
    ),

  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline("/", {
  completion = {
    completeopt = 'menu,menuone,noselect,noinsert'
  },

  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})

-- Use buffer source for `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline("?", {
  completion = {
    completeopt = 'menu,menuone,noselect,noinsert'
  },

  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
  completion = {
    completeopt = 'menu,menuone,noselect,noinsert'
  },

  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
  }),
})

-- FIXME not work at install config position
require("nvim-autopairs").setup({
  map_c_h = true,
  map_c_w = true,
})

