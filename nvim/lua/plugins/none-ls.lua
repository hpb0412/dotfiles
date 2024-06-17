return {
  "nvimtools/none-ls.nvim",   -- for formatters and linters
  config = function()
    local null_ls_status_ok, nonels = pcall(require, "none-ls")
    if not null_ls_status_ok then
      return
    end

    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    local formatting = nonels.builtins.formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    local diagnostics = nonels.builtins.diagnostics

    nonels.setup({
      debug = false,
      sources = {
        formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
        -- formatting.black.with({ extra_args = { "--fast" } }),
        -- formatting.stylua,
        -- formatting.elm_format,
        -- diagnostics.flake8
      },
    })
  end
}
