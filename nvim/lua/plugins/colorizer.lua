return {
  "norcalli/nvim-colorizer.lua", -- Color preview
  config = function()
    local present, colorizer = pcall(require, "colorizer")
    if not present then
      return
    end

    colorizer.setup(
      { "*" },               -- Highlight all files, but customize some others
      {
        RGB = true,          -- #RGB hex codes
        RRGGBB = true,       -- #RRGGBB hex codes
        names = false,       -- "Name" codes like Blue
        RRGGBBAA = false,    -- #RRGGBBAA hex codes
        rgb_fn = true,      -- CSS rgb() and rgba() functions
        hsl_fn = true,      -- CSS hsl() and hsla() functions
        css = false,         -- Enable all css features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = false,      -- Enable all CSS *functions*: rgb_fn, hsl_fn
        mode = "background", -- Set the display mode
      }
    )
  end
}
