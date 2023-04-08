return {
  ------------------
  -- Base plugins --
  ------------------

  "nvim-lua/popup.nvim",             -- An implementation of the Popup API from vim in Neovim
  "nvim-lua/plenary.nvim",           -- Useful lua functions used ny lots of plugins
  "nvim-tree/nvim-web-devicons",     -- font icons used in a lots of plugins
  "antoinemadec/FixCursorHold.nvim", -- needed to fix lsp doc highlight
  {
    "nathom/filetype.nvim",          -- better filetype => faster booting
    init = function()
      vim.g.did_load_filetypes = 1
    end,
  },
  "moll/vim-bbye",                -- Provide Bdelete & Bwipeout

  "L3MON4D3/LuaSnip",             -- snippet engine written in Lua
  "rafamadriz/friendly-snippets", -- a bunch of snippets to use

  "williamboman/mason-lspconfig.nvim",
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("lsp")
    end,
  },
  "tamago324/nlsp-settings.nvim", -- language server settings defined in json

  "p00f/nvim-ts-rainbow",         -- make each pair diffent colors (rainbow)
  "JoosepAlviste/nvim-ts-context-commentstring",
  "windwp/nvim-ts-autotag",       -- Autoclose tags
  'nvim-treesitter/nvim-tree-docs',

  {
    "sindrets/diffview.nvim", -- Diffview
    event = "VimEnter",
  },
}
