local root_pattern = require('lspconfig.util').root_pattern

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

vim.lsp.config('astro', vim.tbl_deep_extend("force", astro_opts, opts))
vim.lsp.config('biome',opts)
vim.lsp.config('clangd', opts)
vim.lsp.config('cmake', opts)
vim.lsp.config('cssls', opts)
vim.lsp.config('elmls', opts)
vim.lsp.config('gleam', opts)
vim.lsp.config('gopls', opts)
vim.lsp.config('html', opts)
vim.lsp.config('jsonls', vim.tbl_deep_extend("force", jsonls_opts, opts))
vim.lsp.config('lua_ls', vim.tbl_deep_extend("force", lua_ls_opts, opts))

-- Temporarily use local `ols` instead of the one from Mason
vim.lsp.config('ols', vim.tbl_deep_extend("force", {
  cmd = { vim.fn.expand("~/ols/ols") },
  filetypes = { "odin" },
  rootdir = {
    root_pattern("ols.json", ".git", "*.odin")
  }
}, opts))
vim.lsp.config('prismals', opts)
vim.lsp.config('tailwindcss', opts)
vim.lsp.config('ts_ls', opts)

-- local ts_opts = {
--   init_options = {
--     plugins = {
--       {
--         name = "@vue/typescript-plugin",
--         location = vim.fs.normalize "/usr/local/lib/node_modules/@vue/typescript-plugin",
--         languages = { "javascript", "typescript", "vue" },
--       },
--     },
--   },
--   filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx",
--     "vue" }
-- }
-- vim.lsp.config.ts_ls', vim.tbl_deep_extend("force", ts_opts, opts))
vim.lsp.config('volar', vim.tbl_deep_extend("force", volar_opts, opts))
