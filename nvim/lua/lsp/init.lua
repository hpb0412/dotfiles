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
vim.lsp.enable('astro')

vim.lsp.config('biome',opts)
vim.lsp.enable('biome')

vim.lsp.config('clangd', opts)
vim.lsp.enable('clangd')

vim.lsp.config('cmake', opts)
vim.lsp.enable('cmake')

vim.lsp.config('cssls', opts)
vim.lsp.enable('cssls')

vim.lsp.config('html', opts)
vim.lsp.enable('html')

vim.lsp.config('jsonls', vim.tbl_deep_extend("force", jsonls_opts, opts))
vim.lsp.enable('jsonls')

vim.lsp.config('lua_ls', vim.tbl_deep_extend("force", lua_ls_opts, opts))
vim.lsp.enable('lua_ls')

vim.lsp.config('markdown_oxide', opts)
vim.lsp.enable('markdown_oxide')

-- Temporarily use local `ols` instead of the one from Mason
-- vim.lsp.config('ols', vim.tbl_deep_extend("force", {
--   cmd = { vim.fn.expand("~/ols/ols") },
--   filetypes = { "odin" },
--   rootdir = function(path)
--     return vim.fs.root(path, {"ols.json", ".git", "*.odin"})
--   end
-- }, opts))
vim.lsp.config('ols', opts)
vim.lsp.enable('ols')

vim.lsp.config('tailwindcss', opts)
vim.lsp.enable('tailwindcss')

vim.lsp.config('ts_ls', opts)
vim.lsp.enable('ts_ls')

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
vim.lsp.enable('volar')
