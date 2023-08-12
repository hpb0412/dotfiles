-- require("plugins.mason")

local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end

local handlers = require("lsp.handlers")
handlers.setup()

local opts = {
  on_attach = handlers.on_attach,
  capabilities = handlers.capabilities,
}

local astro_opts = require("lsp.settings.astro")
local jsonls_opts = require("lsp.settings.jsonls")
local lua_ls_opts = require("lsp.settings.lua_ls")
local volar_opts = require("lsp.settings.volar")

lspconfig.astro.setup(vim.tbl_deep_extend("force", astro_opts, opts))
lspconfig.clangd.setup(opts)
lspconfig.cmake.setup(opts)
lspconfig.cssls.setup(opts)
lspconfig.elmls.setup(opts)
lspconfig.gopls.setup(opts)
lspconfig.html.setup(opts)
lspconfig.jsonls.setup(vim.tbl_deep_extend("force", jsonls_opts, opts))
lspconfig.lua_ls.setup(vim.tbl_deep_extend("force", lua_ls_opts, opts))
lspconfig.prismals.setup(opts)
lspconfig.tailwindcss.setup(opts)
lspconfig.tsserver.setup(opts)
lspconfig.volar.setup(vim.tbl_deep_extend("force", volar_opts, opts))
