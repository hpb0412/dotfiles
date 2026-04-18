return {
    "Exafunction/codeium.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
    },
    config = function()
        local status, codeium = pcall(require, 'codeium')
        if not status then
            vim.notify('Codeium failed to load')
        end

        codeium.setup {
            enable_chat = true
        }
    end
}
