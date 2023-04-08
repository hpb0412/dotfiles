-- Thisfunction will be called at autocmd.lua
function Open_Nvim_Tree(data)
  local IGNORED_FT = {
    "startify",
    "dashboard",
    "alpha",
  }
  -- buffer is a real file on the disk
  --[[ local real_file = vim.fn.filereadable(data.file) == 1 ]]
  -- buffer is a [No Name]
  --[[ local no_name = data.file == "" and vim.bo[data.buf].buftype == "" ]]
  -- only files please
  --[[ if not real_file and not no_name then ]]
  --[[   return ]]
  --[[ end ]]
  -- &ft
  local filetype = vim.bo[data.buf].ft

  -- skip ignored filetypes
  if vim.tbl_contains(IGNORED_FT, filetype) then
    return
  end

  -- open the tree
  require("nvim-tree.api").tree.open()
end

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup({
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
    mappings = {
      custom_only = false,
      list = {
        { key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
        { key = "h",                  cb = tree_cb("close_node") },
        { key = "v",                  cb = tree_cb("vsplit") },
      },
    },
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
