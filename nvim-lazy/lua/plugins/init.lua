return {
  ------------------
  -- Base plugins --
  ------------------

  "nvim-lua/popup.nvim",         -- An implementation of the Popup API from vim in Neovim
  "nvim-lua/plenary.nvim",       -- Useful lua functions used ny lots of plugins
  "nvim-tree/nvim-web-devicons", -- font icons used in a lots of plugins
  "moll/vim-bbye",               -- Provide Bdelete & Bwipeout

  {
    "L3MON4D3/LuaSnip",               -- snippet engine written in Lua
    dependencies = {
      "rafamadriz/friendly-snippets", -- a bunch of snippets to use
    },
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "tamago324/nlsp-settings.nvim", -- language server settings defined in json
    },
    config = function()
      require("lsp")
    end,
  },

  "JoosepAlviste/nvim-ts-context-commentstring",
  'nvim-treesitter/nvim-tree-docs',

  {
    "sindrets/diffview.nvim", -- Diffview
    event = "VimEnter",
  },

  {
    "vhyrro/luarocks.nvim",
    priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
    config = true,
  },
  {
    "nvim-neorg/neorg",
    dependencies = { "luarocks.nvim" },
    lazy = false,  -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
    config = true,
  }
}
