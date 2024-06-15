return {
  "Shatur/neovim-ayu",
  config = function()
    local status_ok, ayu = pcall(require, "ayu")
    if not status_ok then
      vim.notify("Colorscheme `ayu` not found!")
      return
    end

    ayu.setup({
      mirage = true,
      overrides = {},
    })
    ayu.colorscheme()
  end
}
