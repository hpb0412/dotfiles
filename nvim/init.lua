vim.loader.enable() -- this is the replacement of `lewis6991/impatient.nvim`

-- @diagnostic disable-next-line: undefined-field
if vim.g.vscode then
    --
else
    vim.cmd.colorscheme("bamboo")

    require "options"
    require "keymaps"
    require "autocmd"
    -- require "lsp"

    vim.pack.add({
        -- BASE
        "https://github.com/nvim-lua/popup.nvim",
        "https://github.com/nvim-lua/plenary.nvim",
        "https://github.com/nvim-tree/nvim-web-devicons",
        "https://github.com/moll/vim-bbye",
        "https://github.com/JoosepAlviste/nvim-ts-context-commentstring",
        "https://github.com/nvim-treesitter/nvim-tree-docs",
        "https://github.com/sindrets/diffview.nvim",
        "https://github.com/L3MON4D3/LuaSnip",
        "https://github.com/rafamadriz/friendly-snippets",
        -- LSP
        "https://github.com/mason-org/mason-lspconfig.nvim",
        "https://github.com/neovim/nvim-lspconfig",
        "https://github.com/tamago324/nlsp-settings.nvim",
        -- COMPLETION
        "https://github.com/hrsh7th/nvim-cmp",
        "https://github.com/hrsh7th/cmp-buffer",
        "https://github.com/hrsh7th/cmp-path",
        "https://github.com/hrsh7th/cmp-cmdline",
        "https://github.com/hrsh7th/cmp-nvim-lsp",
        "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help",
        "https://github.com/hrsh7th/cmp-omni",
        "https://github.com/hrsh7th/cmp-latex-symbols",
        "https://github.com/saadparwaiz1/cmp_luasnip",

        -- ENHANCE 
        "https://github.com/windwp/nvim-autopairs",
        "https://github.com/windwp/nvim-ts-autotag",
        "https://github.com/akinsho/bufferline.nvim",
        "https://github.com/norcalli/nvim-colorizer.lua",
        "https://github.com/numtostr/comment.nvim",
        "https://github.com/f-person/git-blame.nvim",
        "https://github.com/lewis6991/gitsigns.nvim",
        "https://github.com/lukas-reineke/indent-blankline.nvim",
        "https://github.com/nvim-lualine/lualine.nvim",
        "https://github.com/mason-org/mason.nvim",
        "https://github.com/karb94/neoscroll.nvim",
        "https://github.com/nvimtools/none-ls.nvim",
        "https://github.com/nvim-tree/nvim-tree.lua",
        "https://github.com/hiphish/rainbow-delimiters.nvim",
        "https://github.com/nvim-telescope/telescope.nvim",
        "https://github.com/akinsho/toggleterm.nvim",
        "https://github.com/nvim-treesitter/nvim-treesitter",
        "https://github.com/folke/trouble.nvim",
        "https://github.com/folke/ts-comments.nvim",
        "https://github.com/folke/which-key.nvim",
        "https://github.com/ribru17/bamboo.nvim",
    })

    -- local function packadd(name)
    --     vim.cmd("packadd " .. name)
    -- end
    --
    -- packadd("bamboo.nvim")
    -- packadd("gitsigns.nvim")
    -- packadd("indent-blankline.nvim")
    -- packadd("nvim-colorizer.lua")
    -- packadd("nvim-tree.lua")
    -- packadd("nvim-treesitter")
    -- packadd("neoscroll.nvim")
    -- packadd("rainbow-delimiters.nvim")
    -- packadd("which-key.nvim")

    local inactive = vim.iter(vim.pack.get()):filter(function(x) return not x.active end):map(function(x) return x.spec.name end):totable()

    -- Delete them
    if #inactive > 0 then
      vim.pack.del(inactive)
    end

    require("themes")
    require("plugins")
end
