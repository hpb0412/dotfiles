vim.loader.enable() -- this is the replacement of `lewis6991/impatient.nvim`

---@diagnostic disable-next-line: undefined-field
if vim.g.vscode then
    --
else
    vim.cmd.colorscheme("bamboo")
    require "options"

    require "keymaps"

    require "autocmd"

    -- require "lsp"
end
