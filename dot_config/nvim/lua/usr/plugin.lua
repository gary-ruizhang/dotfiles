-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use { "wbthomason/packer.nvim" } -- Have packer manage itself
  use { "nvim-lua/plenary.nvim" } -- Useful lua functions used by lots of plugins

  use 'lewis6991/impatient.nvim'

  use "lukas-reineke/indent-blankline.nvim"

  -- Completion
  use { "hrsh7th/nvim-cmp" }
  use { "hrsh7th/cmp-nvim-lsp" }
  use { "hrsh7th/cmp-buffer" }
  use { "hrsh7th/cmp-path" }
  use { "hrsh7th/cmp-cmdline" }

  -- Snippets
  use { "L3MON4D3/LuaSnip" }
  use { "saadparwaiz1/cmp_luasnip" }

  -- LSP
  use { "neovim/nvim-lspconfig" }

  -- Telescope
  use { 'nvim-telescope/telescope.nvim', requires = { "nvim-lua/plenary.nvim" } }

  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make',
    config = function()
      require('telescope').load_extension('fzf')
    end,
  }

  use {
    "AckslD/nvim-neoclip.lua",
    requires = {
      {'kkharji/sqlite.lua', module = 'sqlite'},
      {'nvim-telescope/telescope.nvim'},
    },
    config = function()
      require('neoclip').setup({
        enable_persistent_history = true,
      })
      require('telescope').load_extension('neoclip')
    end,
  }

  use {
    "nvim-telescope/telescope-frecency.nvim",
    config = function()
      require"telescope".load_extension("frecency")
    end,
    requires = {"kkharji/sqlite.lua"}
  }

  use {
    "jvgrootveld/telescope-zoxide",
    config = function()
      require('telescope').load_extension('zoxide')
    end,
  }

  -- Treesitter
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

  -- Autopairs
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  -- Comment
  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }

  -- surround
  use({
    "kylechui/nvim-surround",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
  })

  -- jump anywhere
  use {
    "ggandor/leap.nvim",
    config = function ()
      require('leap').set_default_keymaps()
    end
  }

  use {
    "ggandor/flit.nvim",
    config = function ()
      require('flit').setup()
    end
  }

  -- align
  use 'Vonr/align.nvim'

  -- Theme
  use { "EdenEast/nightfox.nvim" }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
