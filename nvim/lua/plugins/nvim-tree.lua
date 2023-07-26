local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings (migrated from view.mappings.list)
  -- vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts('Up'))
  -- vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
  -- vim.keymap.set('n', 'v', api.tree.vsplit, opts('VSplit'))
  -- vim.keymap.set('n', 'V', api.tree.split, opts('Split'))
end

return {
  "kyazdani42/nvim-tree.lua", -- Treeview
  config = function()
    local status_ok, nvim_tree = pcall(require, "nvim-tree")
    if not status_ok then
      return
    end

    nvim_tree.setup({
      on_attach = my_on_attach,
      auto_reload_on_write = true,
      disable_netrw = true,
      hijack_cursor = false,
      hijack_netrw = true,
      hijack_unnamed_buffer_when_opening = false,
      open_on_tab = false,
      sort_by = "name",
      update_cwd = true,
      view = {
        width = 42,
        --[[ height = 30, ]]
        side = "right",
        hide_root_folder = false,
        preserve_window_proportions = false,
        number = true,
        relativenumber = true,
        signcolumn = "yes",
      },
      renderer = {
        highlight_git = true,
        root_folder_modifier = ":t",
        indent_markers = {
          enable = true,
          icons = {
            corner = "└ ",
            edge = "│ ",
            none = "  ",
          },
        },
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
          symlink_arrow = " ➛ ",
          glyphs = {
            --[[ default = "", ]]
            default = "",
            symlink = "",
            folder = {
              arrow_closed = "❯",
              arrow_open = "",
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
              symlink_open = "",
            },
            git = {
              -- unstaged = "",
              -- staged = "S",
              -- unmerged = "",
              -- renamed = "➜",
              -- untracked = "U",
              -- deleted = "",
              -- ignored = "◌",
            },
          },
        },
      },
      hijack_directories = {
        enable = true,
        auto_open = true,
      },
      update_focused_file = {
        enable = true,
        update_root = true, -- previousely update_cwd
        ignore_list = {},
      },
      system_open = {
        cmd = nil,
        args = {},
      },
      diagnostics = {
        enable = true,
        show_on_dirs = false,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
      },
      filters = {
        dotfiles = false,
        custom = {},
        exclude = {},
      },
      git = {
        enable = true,
        ignore = true,
        timeout = 500,
      },
      actions = {
        use_system_clipboard = true,
        -- change_dir = {
        --   enable = true,
        --   global = false,
        -- },
        open_file = {
          quit_on_open = false,
          resize_window = true,
          window_picker = {
            enable = true,
            chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
            exclude = {
              filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame", "Outline" },
              buftype = { "terminal", "help" },
            },
          },
        },
      },
      trash = {
        cmd = "trash",
        require_confirm = true,
      },
      log = {
        enable = false,
        truncate = false,
        types = {
          all = false,
          config = false,
          copy_paste = false,
          git = false,
          profile = false,
        },
      },
    })
  end
}
