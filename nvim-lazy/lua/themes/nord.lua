return {
  {
    "shaunsingh/nord.nvim", -- Colorscheme
    commit = "78f5f001709b5b321a35dcdc44549ef93185e024",
  },
  config = function()
    local status_ok, nord = pcall(require, "nord")
    if not status_ok then
      vim.notify("Colorscheme `nord` not found!")
      return
    end

    vim.g.nord_contrast = true
    vim.g.nord_borders = true
    vim.g.nord_disable_background = false
    vim.g.nord_italic = true

    nord.set()
  end
}
