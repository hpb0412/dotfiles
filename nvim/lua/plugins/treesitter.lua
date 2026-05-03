return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local present, treesitter = pcall(require, "nvim-treesitter")
		if not present then
			vim.notify("Cannot load nvim-treesitter")
			return
		end

		treesitter.setup({
			ensure_installed = {
				"bash",
				"c",
				"cmake",
				"cpp",
				"css",
				"dockerfile",
				"dot",
				"gitignore",
				"html",
				"javascript",
				"jsdoc",
				"json",
				"jsonc",
				"llvm",
				"lua",
				"make",
				"markdown",
				"markdown_inline",
				"php",
				"phpdoc",
				"odin",
				"python",
				"scss",
				"sql",
				"toml",
				"tsx",
				"typescript",
				"vim",
				"yaml",
			}, -- A list of parser names, or "all"
			auto_install = true, -- Automatically install missing parsers when entering buffer
			sync_install = false, -- Install parsers synchronously (only applied to `ensure_installed`)
			ignore_install = { "" }, -- List of parsers to ignore installing
			highlight = {
				enable = true, -- false will disable the whole extension
				disable = { "" }, -- list of language that will be disabled
				additional_vim_regex_highlighting = false, -- turn off coz not compatible with 0.12+
			},
			indent = { enable = true, disable = { "yaml" } },
			autopairs = {
				enable = true,
			},
			-- `tree_docs` is provided by `nvim-treesitter/nvim-tree-docs`
			tree_docs = {
				enable = false, -- turn off coz not compatible with 0.12
			},
		})
	end,
}
