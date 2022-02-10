-- local status_ok, ayu = pcall(require, "ayu")
-- if not status_ok then
--   vim.notify("Colorscheme `ayu` not found!")
--   return
-- end
--
-- ayu.setup({
--   mirage = true,
--   overrides = {},
-- })
-- ayu.colorscheme()

local status_ok, nord = pcall(require, "nord")
if not status_ok then
  vim.notify("Colorscheme `nord` not found!")
  return
end

-- Example config in lua
vim.g.nord_contrast = true
vim.g.nord_borders = false
vim.g.nord_disable_background = false
vim.g.nord_italic = false

-- Load the colorscheme
nord.set()

