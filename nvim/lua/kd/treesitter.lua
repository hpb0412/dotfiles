local configs = require("nvim-treesitter.configs")
configs.setup {
  -- ensure_installed = "maintained",
  -- no able to set `ensure_installed` with "maintained" anymore
  -- use "*" or explicit list `{ "c", "lua", "rust" }`
  sync_install = false, 
  ignore_install = { "" }, -- List of parsers to ignore installing
  autopairs = {
    enable = true,
  },
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,

  },
  indent = { enable = true, disable = { "yaml" } },
  -- `rainbow` is provided by `p00f/nvim-ts-rainbow` plugin
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
  -- context_commentstring is provided by `JoosepAlviste/nvim-ts-context-commentstring`
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  -- `autotag` is provided by `windwp/nvim-ts-autotag`
  autotag = {
    enable = true,
  },
  -- `tree_docs` is provided by `nvim-treesitter/nvim-tree-docs`
  tree_docs = {
    enable = true,
  }
}

