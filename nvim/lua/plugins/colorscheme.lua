-- return {
--   "Shatur/neovim-ayu",
--   config = function()
--     local status_ok, ayu = pcall(require, "ayu")
--     if not status_ok then
--       vim.notify("Colorscheme `ayu` not found!")
--       return
--     end
--
--     ayu.setup({
--       mirage = true,
--       overrides = {},
--     })
--     ayu.colorscheme()
--   end
-- }

-- return {
--   "Shatur/neovim-ayu",
--   {
--     "shaunsingh/nord.nvim", -- Colorscheme
--     commit = "78f5f001709b5b321a35dcdc44549ef93185e024",
--   },
--   config = function()
--     local status_ok, nord = pcall(require, "nord")
--     if not status_ok then
--       vim.notify("Colorscheme `nord` not found!")
--       return
--     end
--
--     vim.g.nord_contrast = true
--     vim.g.nord_borders = true
--     vim.g.nord_disable_background = false
--     vim.g.nord_italic = true
--
--     nord.set()
--   end
-- }

-- return {
--   "catppuccin/nvim",
--   name = "catppuccin",
--   config = function()
--     local status_ok, catppuccin = pcall(require, "catppuccin")
--     if not status_ok then
--       vim.notify("Colorscheme `catppuccin` not found!")
--       return
--     end
--
--     catppuccin.setup({
--       flavour = "frappe", -- mocha, macchiato, frappe, latte
--       background = {
--         -- :h background
--         light = "macchiato",
--         dark = "frappe",
--       },
--       compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
--       transparent_background = false,
--       term_colors = false,
--       dim_inactive = {
--         enabled = false,
--         shade = "dark",
--         percentage = 0.15,
--       },
--       styles = {
--         comments = { "italic" },
--         conditionals = { "italic" },
--         loops = {},
--         functions = {},
--         keywords = {},
--         strings = {},
--         variables = {},
--         numbers = {},
--         booleans = {},
--         properties = {},
--         types = {},
--         operators = {},
--       },
--       color_overrides = {},
--       custom_highlights = {},
--       integrations = {
--         cmp = true,
--         gitsigns = true,
--         nvimtree = true,
--         markdown = true,
--         mason = true,
--         symbols_outline = true,
--         telescope = true,
--         treesitter = true,
--         treesitter_context = true,
--         ts_rainbow = true,
--         which_key = true,
--         -- bufferline, indent_blankline, lualine
--         -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
--       },
--     })
--     vim.api.nvim_command("colorscheme catppuccin")
--   end
-- }

return {
  "rebelot/kanagawa.nvim",
  config = function()
    local status_ok, kanagawa = pcall(require, "kanagawa")
    if not status_ok then
      vim.notify("Colorscheme `kanagawa` not found!")
      return
    end

    kanagawa.setup({
      compile = false,     -- enable compiling the colorscheme
      undercurl = true,    -- enable undercurls
      commentStyle = { italic = true },
      functionStyle = {},
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      typeStyle = {},
      transparent = false, -- do not set background color
      dimInactive = false, -- dim inactive window `:h hl-NormalNC`
      terminalColors = true, -- define vim.g.terminal_color_{0,17}
      colors = {
                           -- add/modify theme and palette colors
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
      },
      overrides = function(colors) -- add/modify highlights
        return {}
      end,
      theme = "wave",  -- Load "wave" theme when 'background' option is not set
      background = {
                       -- map the value of 'background' option to a theme
        dark = "wave", -- try "dragon" !
        light = "lotus"
      },
    })

    vim.cmd("colorscheme kanagawa")
  end
}
