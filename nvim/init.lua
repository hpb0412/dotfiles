if vim.g.vscode then
  -- VSCode extension
else
  -- Automatically install lazy.nvim
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
    })
  end
  vim.opt.rtp:prepend(lazypath)

  -- Use a protected call so we don't error out on first use
  local status_ok, lazy = pcall(require, "lazy")
  if not status_ok then
    vim.notify("`lazy.nvim` not found!")
    return
  end

  -- lazy requires <leader> keymap before init
  require "keymaps"

  -- lazy requires "termguicolors must be set"
  require "options"

  -- Install your plugins here
  lazy.setup "plugins"

  require "autocmd"
end
