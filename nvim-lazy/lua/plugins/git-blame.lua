return {
    "f-person/git-blame.nvim",
    config = function()
        local status_ok, gitblame = pcall(require, "gitblame")
        if not status_ok then
            return
        end

        gitblame.setup {
            ignored_filetypes = {
                "packer",
                "NvimTree",
                "DiffviewFileHistory",
                "Outline",
            },

            message_template = " <author> • <date> • <summary>",
            date_format = "%c",
            highlight_group = "Comment",
            display_virtual_text = 1,
            -- ignored_filetypes = { "lua", "c" }
            enabled = 1,
        }
    end
}
