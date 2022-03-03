local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
  local handlers = require("kd.lsp.handlers")
	local opts = {
		on_attach = handlers.on_attach,
		capabilities = handlers.capabilities,
	}

  if server.name == "jsonls" then
    local jsonls_opts = require("kd.lsp.settings.jsonls")
    opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
  end

  if server.name == "sumneko_lua" then
    local sumneko_opts = require("kd.lsp.settings.sumneko_lua")
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end

  -- if server.name == "vuels" then
  --   local vuels_opts = require("kd.lsp.settings.vuels")
  --   opts = vim.tbl_deep_extend("force", vuels_opts, opts)
  -- end

  -- if server.name == "elmls" then
  --   local elmls_opts = require("kd.lsp.settings.elmls")
  --   opts = vim.tbl_deep_extend("force", elmls_opts, opts)
  -- end


  -- (optional) Customize the options passed to the server
  -- if server.name == "tsserver" then
  --     opts.root_dir = function() ... end
  -- end

	-- This setup() function is exactly the same as lspconfig's setup function.
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	server:setup(opts)
end)

