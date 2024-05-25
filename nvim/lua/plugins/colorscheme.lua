local status_ok, cs = pcall(require, "themes.tokyonight")

if not status_ok then
  vim.notify("Colorscheme not found!")
end

return cs
