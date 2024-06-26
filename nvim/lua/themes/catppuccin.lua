return {
  "catppuccin/nvim",
  name = "catppuccin",
  config = function()
    local status_ok, catppuccin = pcall(require, "catppuccin")
    if not status_ok then
      vim.notify("Colorscheme `catppuccin` not found!")
      return
    end

    catppuccin.setup({
      flavour = "frappe", -- mocha, macchiato, frappe, latte
      background = {
        -- :h background
        light = "macchiato",
        dark = "frappe",
      },
      compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
      transparent_background = false,
      term_colors = false,
      dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
      },
      styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
      color_overrides = {},
      custom_highlights = {},
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        markdown = true,
        mason = true,
        symbols_outline = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        ts_rainbow = true,
        which_key = true,
        -- bufferline, indent_blankline, lualine
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
      },
    })
    vim.api.nvim_command("colorscheme catppuccin")
  end
}
