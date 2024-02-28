return {
  "lukas-reineke/indent-blankline.nvim", -- Indent lines
  main = "ibl",
  config = function()
    local status_ok, ibl = pcall(require, "ibl")
    if not status_ok then
      return
    end

    local hooks = require "ibl.hooks"

    -- create the highlight groups in the highlight setup hook, so they are reset
    -- every time the colorscheme changes
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
      vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
      vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
      vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
      vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
      vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
      vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
    end)

    ibl.setup({
      enabled = true,
      indent = {
        char = "▏"
      },
      whitespace = {
        highlight = {
          "CursorColumn",
          "Whitespace",

        }
      },
      exclude = {
        buftypes = {
          "terminal", "nofile"
        },
        filetypes = {
          "help",
          "startify",
          "dashboard",
          "packer",
          "neogitstatus",
          "NvimTree",
          "Trouble",
        },
      },
      scope = {
        highlight = {
          "RainbowRed",
          "RainbowYellow",
          "RainbowBlue",
          "RainbowOrange",
          "RainbowGreen",
          "RainbowViolet",
          "RainbowCyan",
        }
      }
    })

    hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)

    -- vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
    -- vim.g.indent_blankline_filetype_exclude = {
    --   "help",
    --   "startify",
    --   "dashboard",
    --   "packer",
    --   "neogitstatus",
    --   "NvimTree",
    --   "Trouble",
    -- }
    -- vim.g.indentLine_enabled = 1
    -- -- vim.g.indent_blankline_char = "│"
    -- vim.g.indent_blankline_char = "▏"
    -- -- vim.g.indent_blankline_char = "▎"
    -- vim.g.indent_blankline_show_trailing_blankline_indent = false
    -- vim.g.indent_blankline_show_first_indent_level = true
    -- vim.g.indent_blankline_use_treesitter = true
    -- vim.g.indent_blankline_context_patterns = {
    --   "class",
    --   "return",
    --   "function",
    --   "method",
    --   "^if",
    --   "^while",
    --   "jsx_element",
    --   "^for",
    --   "^object",
    --   "^table",
    --   "block",
    --   "arguments",
    --   "if_statement",
    --   "else_clause",
    --   "jsx_element",
    --   "jsx_self_closing_element",
    --   "try_statement",
    --   "catch_clause",
    --   "import_statement",
    --   "operation_type",
    -- }

    -- HACK: work-around for https://github.com/lukas-reineke/indent-blankline.nvim/issues/59
    vim.wo.colorcolumn = "99999"

    -- vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
    -- vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
    -- vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
    -- vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
    -- vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
    -- vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]
    vim.opt.list = true
    -- some useful icons: »«■¬
    vim.opt.listchars:append({
      -- space = '⋅',
      -- eol = '↴',
      tab = "»»",
      trail = "■",
      nbsp = "␣",
      extends = "→",
      precedes = "←",
    })

    -- indent_blankline.setup({
    --   enabled = true,
    --   colored_indent_levels = false,
    --   show_end_of_line = true,
    --   space_char_blankline = " ",
    --   show_current_context = true,
    --   show_current_context_start = true,
    --
    --   -- show_current_context_start = true,
    --   -- char_highlight_list = {
    --   --   "IndentBlanklineIndent1",
    --   --   "IndentBlanklineIndent2",
    --   --   "IndentBlanklineIndent3",
    --   -- },
    -- })
  end
}
