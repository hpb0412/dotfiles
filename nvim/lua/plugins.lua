local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	vim.notify("`packer` not found!")
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	------------------
	-- Base plugins --
	------------------

	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
	-- use "Shatur/neovim-ayu" -- Colorscheme
	use("shaunsingh/nord.nvim") -- Colorscheme
	use("kyazdani42/nvim-web-devicons") -- font icons used in a lots of plugins
	use("lewis6991/impatient.nvim") -- load optimizing
	use({
		"nathom/filetype.nvim", -- better filetype => faster booting
		setup = function()
			vim.g.did_load_filetypes = 1
		end,
	})
	use({
    "folke/which-key.nvim", -- suggest key binding
    event = "VimEnter",
    config = function()
      require("kd.whichkey")
    end,
  })
	use("antoinemadec/FixCursorHold.nvim") -- needed to fix lsp doc highlight
	use({
		"karb94/neoscroll.nvim", -- smooth scrolling when navigate
		event = "BufRead",
		config = function()
			require("kd.neoscroll")
		end,
	})

	---------------------
	-- Auto-Completion --
	---------------------

	use({
		"hrsh7th/nvim-cmp", -- The core completion plugin
		event = "BufRead",
		config = function()
			require("kd.completion")
		end,
	})
	use({
		"hrsh7th/cmp-buffer", -- buffer completions
		after = "nvim-cmp",
	})
	use({
		"hrsh7th/cmp-path", -- path completions
		after = "nvim-cmp",
	})
	use({
		"hrsh7th/cmp-cmdline", -- cmdline completions
		after = "nvim-cmp",
	})
	use({
		"saadparwaiz1/cmp_luasnip", -- snippet completions
		after = "nvim-cmp",
	})
	use({
		"hrsh7th/cmp-nvim-lsp",
		after = "nvim-cmp",
	})
	use({
		"hrsh7th/cmp-nvim-lua",
		after = "nvim-cmp",
	})

	-- Snippets
	use({
		"L3MON4D3/LuaSnip", -- snippet engine written in Lua
		after = "cmp_luasnip",
	})
	use({
		"rafamadriz/friendly-snippets", -- a bunch of snippets to use
		after = "LuaSnip",
	})

	------------------------------------------
	-- Language Server Protocol - a.k.a LSP --
	------------------------------------------

	use({
		"neovim/nvim-lspconfig", -- enable LSP
		event = "BufRead",
		config = function()
			require("kd.lsp")
		end,
	})
	use({
		"williamboman/nvim-lsp-installer",
		event = "BufRead", -- simple to use language server installer
	})
	use("tamago324/nlsp-settings.nvim") -- language server settings defined in json for

	-------------
	-- Non LSP --
	-------------

	use({
		"jose-elias-alvarez/null-ls.nvim", -- for formatters and linters
		event = "BufRead",
		config = function()
			require("kd.null-ls")
		end,
	})

	-- Fuzzy Search/Find
	use("nvim-telescope/telescope.nvim")
	-- use "nvim-telescope/telescope-media-files.nvim"

	---------------------------------------------
	-- Syntax Highlight/Language Parser engine --
	---------------------------------------------

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		event = "BufRead",
		config = function()
			require("kd.treesitter")
		end,
	})
	use("p00f/nvim-ts-rainbow") -- make each pair diffent colors (rainbow)
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("windwp/nvim-ts-autotag") -- Autoclose tags

	-------------------------------------------
	-- Utils without depending on TreeSitter --
	-------------------------------------------

	use({
		"windwp/nvim-autopairs", -- Auto pairs - a.k.a ()[]{}''``""
		event = "InsertEnter",
		config = function()
			require("kd.autopairs")
		end,
	})
	use({
		"lukas-reineke/indent-blankline.nvim", -- Indent lines
		event = "BufReadPre",
		config = function()
			require("kd.indentline")
		end,
	})
	use({
		"numToStr/Comment.nvim", -- commenting
		event = "BufRead",
		config = function()
			require("kd.comment")
		end,
	})
	use({
		"norcalli/nvim-colorizer.lua", -- Color preview
		event = "BufRead",
		config = function()
			require("kd.colorizer")
		end,
	})

	----------------
	-- Git Stuffs --
	----------------

	use({
		"lewis6991/gitsigns.nvim",
		event = "BufRead",
		config = function()
			require("kd.gitsigns")
		end,
	})
	use({
    "sindrets/diffview.nvim",
    event="VimEnter",
  })
	use({
		"f-person/git-blame.nvim",
		event = "BufRead",
    config = function()
      vim.g.gitblame_ignored_filetypes = {
        "packer",
        "NvimTree"
      }
    end
	})

	------------------------
	-- Convenience Stuffs --
	------------------------

	-- Treeview
	use("kyazdani42/nvim-tree.lua")

	-- Open Files Tablist
	use({
		"akinsho/bufferline.nvim",
		event = "BufRead",
		after = "nvim-web-devicons",
		config = function()
			require("kd.bufferline")
		end,
	})
	use({
		"moll/vim-bbye",
		after = "bufferline.nvim",
	})

	-- Status line
	use({
		"nvim-lualine/lualine.nvim",
		after = "bufferline.nvim",
		config = function()
			require("kd.lualine")
		end,
	})

	-- Terminal
	use("akinsho/toggleterm.nvim")

	-- Project
	use("ahmedkhalf/project.nvim")

	-- Dashboard
	use("goolord/alpha-nvim")

	use({
		"simrat39/symbols-outline.nvim",
		cmd = "SymbolsOutline",
		setup = function()
			require("kd.symbols-outline")
		end,
	})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
