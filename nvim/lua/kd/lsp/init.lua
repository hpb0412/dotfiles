local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("kd.lsp.installer")
local handlers = require("kd.lsp.handlers")
handlers.setup()

-- [TODO] spend sometime for gdscript
-- ref: https://www.reddit.com/r/neovim/comments/oedk9z/help_getting_gdscript_to_work_with_nvimlsp/
lspconfig["gdscript"].setup({
	flags = {
		on_attach = handlers.on_attach,
		debounce_text_changes = 150,
	},
})
