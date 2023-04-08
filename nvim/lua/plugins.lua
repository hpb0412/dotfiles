local fn = vim.fn

-- Automatically install lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
  vim.notify("`lazy.nvim` not found!")
  return
end

-- Install your plugins here
return lazy.setup {
  ------------------
  -- Base plugins --
  ------------------

  "nvim-lua/popup.nvim",    -- An implementation of the Popup API from vim in Neovim
  "nvim-lua/plenary.nvim",  -- Useful lua functions used ny lots of plugins
  -- use "Shatur/neovim-ayu" -- Colorscheme
  -- {
  --   "shaunsingh/nord.nvim", -- Colorscheme
  --   commit = "78f5f001709b5b321a35dcdc44549ef93185e024",
  -- },
  {
    "catppuccin/nvim",
    as = "catppuccin",
  },

  "kyazdani42/nvim-web-devicons", -- font icons used in a lots of plugins
  "lewis6991/impatient.nvim",     -- load optimizing
  {
    "nathom/filetype.nvim",       -- better filetype => faster booting
    init = function()
      vim.g.did_load_filetypes = 1
    end,
  },
  {
    "folke/which-key.nvim", -- suggest key binding
    event = "VimEnter",
    config = function()
      require("kd.whichkey")
    end,
  },
  "antoinemadec/FixCursorHold.nvim", -- needed to fix lsp doc highlight
  {
    "karb94/neoscroll.nvim",         -- smooth scrolling when navigate
    event = "BufReadPre",
    config = function()
      require("kd.neoscroll")
    end,
  },

  ---------------------
  -- Auto-Completion --
  ---------------------

  {
    "hrsh7th/nvim-cmp", -- The core completion plugin
    event = "BufRead",
    config = function()
      require("kd.completion")
    end,
  },
  "hrsh7th/cmp-buffer",       -- buffer completions
  "hrsh7th/cmp-path",         -- path completions
  "hrsh7th/cmp-cmdline",      -- cmdline completions
  "saadparwaiz1/cmp_luasnip", -- snippet completions
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-nvim-lua",

  -- Snippets
  {
    "L3MON4D3/LuaSnip", -- snippet engine written in Lua
  },
  {
    "rafamadriz/friendly-snippets", -- a bunch of snippets to use
  },

  ------------------------------------------
  -- Language Server Protocol - a.k.a LSP --
  ------------------------------------------

  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("kd.lsp")
    end,
  },
  "tamago324/nlsp-settings.nvim", -- language server settings defined in json for

  -------------
  -- Non LSP --
  -------------

  {
    "jose-elias-alvarez/null-ls.nvim", -- for formatters and linters
    event = "BufRead",
    config = function()
      require("kd.null-ls")
    end,
  },

  -- Fuzzy Search/Find
  "nvim-telescope/telescope.nvim",
  -- use "nvim-telescope/telescope-media-files.nvim"

  ---------------------------------------------
  -- Syntax Highlight/Language Parser engine --
  ---------------------------------------------

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufRead",
    config = function()
      require("kd.treesitter")
    end,
  },
  "p00f/nvim-ts-rainbow",   -- make each pair diffent colors (rainbow)
  "JoosepAlviste/nvim-ts-context-commentstring",
  "windwp/nvim-ts-autotag", -- Autoclose tags
  'nvim-treesitter/nvim-tree-docs',

  -------------------------------------------
  -- Utils without depending on TreeSitter --
  -------------------------------------------

  {
    "windwp/nvim-autopairs", -- Auto pairs - a.k.a ()[]{}''``""
    event = "InsertEnter",
    config = function()
      require("kd.autopairs")
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim", -- Indent lines
    config = function()
      require("kd.indentline")
    end,
  },
  {
    "numToStr/Comment.nvim", -- commenting
    event = "BufRead",
    config = function()
      require("kd.comment")
    end,
  },
  {
    "norcalli/nvim-colorizer.lua", -- Color preview
    event = "BufRead",
    config = function()
      require("kd.colorizer")
    end,
  },

  ----------------
  -- Git Stuffs --
  ----------------

  {
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    config = function()
      require("kd.gitsigns")
    end,
  },
  {
    "sindrets/diffview.nvim",
    event = "VimEnter",
  },
  {
    "f-person/git-blame.nvim",
    event = "BufRead",
    init = function()
      require("kd/git-blame")
    end,
  },

  ------------------------
  -- Convenience Stuffs --
  ------------------------

  -- Treeview
  "kyazdani42/nvim-tree.lua",

  -- Open Files Tablist
  {
    "akinsho/bufferline.nvim",
    event = "BufRead",
    config = function()
      require("kd.bufferline")
    end,
  },
  "moll/vim-bbye",

  -- Status line
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("kd.lualine")
    end,
  },

  "akinsho/toggleterm.nvim",       -- Terminal
  "ahmedkhalf/project.nvim",       -- Project
  "goolord/alpha-nvim",            -- Dashboard
  "simrat39/symbols-outline.nvim", -- Outline


  -- Markdown Preview
  {
    "ellisonleao/glow.nvim",
    config = function()
      require("kd.glow")
    end,
  },

  -- REST
  {
    "rest-nvim/rest.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("kd.rest")
    end
  },

  {
    'codota/tabnine-nvim',
    build = "./dl_binaries.sh",
    config = function()
      require("kd.tabnine")
    end
  },
}
