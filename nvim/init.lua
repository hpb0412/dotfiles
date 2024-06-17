vim.loader.enable() -- this is the replacement of `lewis6991/impatient.nvim`

---@diagnostic disable-next-line: undefined-field
if vim.g.vscode then
    --
else
    local rocks_config = {
        rocks_path = vim.env.HOME .. "/.local/share/nvim/rocks",
    }

    vim.g.rocks_nvim = rocks_config

    local luarocks_path = {
        vim.fs.joinpath(rocks_config.rocks_path, "share", "lua", "5.1", "?.lua"),
        vim.fs.joinpath(rocks_config.rocks_path, "share", "lua", "5.1", "?", "init.lua"),
    }
    package.path = package.path .. ";" .. table.concat(luarocks_path, ";")

    local luarocks_cpath = {
        vim.fs.joinpath(rocks_config.rocks_path, "lib", "lua", "5.1", "?.so"),
        vim.fs.joinpath(rocks_config.rocks_path, "lib64", "lua", "5.1", "?.so"),
        -- Remove the dylib and dll paths if you do not need macos or windows support
        vim.fs.joinpath(rocks_config.rocks_path, "lib", "lua", "5.1", "?.dylib"),
        vim.fs.joinpath(rocks_config.rocks_path, "lib64", "lua", "5.1", "?.dylib"),
        vim.fs.joinpath(rocks_config.rocks_path, "lib", "lua", "5.1", "?.dll"),
        vim.fs.joinpath(rocks_config.rocks_path, "lib64", "lua", "5.1", "?.dll"),
    }
    package.cpath = package.cpath .. ";" .. table.concat(luarocks_cpath, ";")

    vim.opt.runtimepath:append(vim.fs.joinpath(rocks_config.rocks_path, "lib", "luarocks", "rocks-5.1", "*", "*"))



    -- use this to test runtimepath
    -- vim.cmd("echo &runtimepath")
    -- :new | put =split(&runtimepath, ',') -- https://vi.stackexchange.com/questions/41952/how-to-display-runtimepath-value-in-echo-or-echomsg
    -- I found `~/.local/share/nvim/rocks/rocks_rtp` was append after init
    vim.opt.runtimepath:append(vim.fs.joinpath(rocks_config.rocks_path, "rocks_rtp")) -- need it here for lualine.nvim to work

    require "options"

    require "keymaps"

    require "autocmd"

    require "lsp"

    require("plugins.autopairs").config()
    require("plugins.autotag").config()
    require("plugins.bufferline").config()
    require("plugins.colorizer").config()
    require("plugins.colorscheme").config()
    require("plugins.completion").config()
    require("plugins.git-blame").config()
    require("plugins.gitsigns").config()
    require("plugins.indentline").config()
    require("plugins.lualine").config()
    require("plugins.mason").config()
    require("plugins.neorg").config()
    require("plugins.neoscroll").config()
    require("plugins.none-ls").config()
    require("plugins.nvim-tree").config()
    require("plugins.rainbow-delimiters").config()
    require("plugins.telescope").config()
    require("plugins.toggleterm").config()
    require("plugins.treesitter").config()
    require("plugins.trouble").config_rock()
    require("plugins.whichkey").config()

    -- AI tools
    -- require("plugins.tabnine").config()
    require("plugins.codeium").config()
end
