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
}
