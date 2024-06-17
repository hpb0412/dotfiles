return {
    "nvim-neorg/neorg",
    dependencies = { "luarocks.nvim" },
    lazy = false,  -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
    -- config = true,
    config = function()
        local status, neorg = pcall(require, "neorg")
        if (not status) then return end

        neorg.setup()
    end
}
