local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "kd.lsp.lsp-installer"
require("kd.lsp.handlers").setup()

