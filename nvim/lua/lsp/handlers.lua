local M = {}

M.setup = function()
    -- define icons for diagnostic sign types
    local signs = {
        { name = "DiagnosticSignError", text = "" },
        { name = "DiagnosticSignWarn",  text = "" },
        { name = "DiagnosticSignHint",  text = "" },
        { name = "DiagnosticSignInfo",  text = "" },
        { name = "DiagnosticSignOk",    text = "" }, -- 󰠠
    }

    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    end

    -- configurations
    local config = {
        virtual_text = false, -- disable virtual text
        signs = {
            active = signs,   -- show signs
        },
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
            focusable = false,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
        },
    }
    vim.diagnostic.config(config)

    -- define handlers
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
    })

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded",
    })
end

-----------------------------
-- Local Utility Functions --
-----------------------------

local function lsp_client_document_formatting(client)
    -- turn off formatter (to use prettier's formatter from null-ls)
    if
    -- client.name == "tsserver"
        client.name == "jsonls"
        or client.name == "html"
        or client.name == "volar"
    then
        client.server_capabilities.document_formatting = false
    end
end

local function lsp_keymaps(bufnr)
    local opts = { noremap = true, silent = true }
    local keymap = vim.api.nvim_buf_set_keymap

    -- lsp buffer
    keymap(bufnr, "n", "ff", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", opts)
    keymap(bufnr, "n", "gca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    keymap(bufnr, "n", "grn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)

    -- code lens
    keymap(bufnr, "n", "gcl", "<cmd>lua vim.lsp.codelens.run()<CR>", opts)

    -- diagnostics
    keymap(bufnr, "n", "gl", '<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<CR>', opts)
    keymap(bufnr, "n", "gq", '<cmd>lua vim.diagnostic.set_loclist()<CR>', opts) -- Quickfix
    keymap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
    keymap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
    --[[ keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts) ]]
end

local function lsp_highlight_document(client, bufnr)
    -- For neovim 0.7+
    -- Server capabilities spec:
    -- https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#serverCapabilities
    if client.server_capabilities.documentHighlightProvider then
        vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
        vim.api.nvim_clear_autocmds { buffer = bufnr, group = "lsp_document_highlight" }
        vim.api.nvim_create_autocmd("CursorHold", {
            callback = vim.lsp.buf.document_highlight,
            buffer = bufnr,
            group = "lsp_document_highlight",
            desc = "Document Highlight",
        })
        vim.api.nvim_create_autocmd("CursorMoved", {
            callback = vim.lsp.buf.clear_references,
            buffer = bufnr,
            group = "lsp_document_highlight",
            desc = "Clear All the References",
        })
    end

    -- For neovim < 0.7
    if client.server_capabilities.document_highlight then
        ---@diagnostic disable: deprecated
        vim.api.nvim_exec(
            [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
            false
        )
    end
end

--------------------------------------------
-- Export items of this module are here --
--------------------------------------------

-- create `Format` command that will be used later in `lsp_keymaps(...)`
vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format({ async = true })' ]])

M.on_attach = function(client, bufnr)
    lsp_client_document_formatting(client)
    lsp_keymaps(bufnr)
    lsp_highlight_document(client, bufnr)
end

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if status_ok then
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true -- for cssls and html and jsonls
    M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

return M
