return {
  "windwp/nvim-autopairs", -- Auto pairs - a.k.a ()[]{}''``""
  event = "InsertEnter",
  -- opts = {
  --   check_ts = true,
  --   ts_config = {
  --     lua = { "string", "source" },
  --     javascript = { "string", "template_string" },
  --     java = false,
  --   },
  --   disable_filetype = { "TelescopePrompt", "spectre_panel" },
  --   fast_wrap = {
  --     map = "´", -- on mac <A-e> is ´
  --     chars = { "{", "[", "(", '"', "'" },
  --     pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
  --     offset = 0, -- Offset from pattern match
  --     end_key = "$",
  --     keys = "qwertyuiopzxcvbnmasdfghjkl",
  --     check_comma = true,
  --     highlight = "PmenuSel",
  --     highlight_grey = "LineNr",
  --   },
  -- },
  config = function()
    -- below is hooking into nvim-cmp to support auto pair when use auto-completion feature
    local cmp_autopairs = require "nvim-autopairs.completion.cmp"
    local cmp_status_ok, cmp = pcall(require, "cmp")
    if not cmp_status_ok then
      return
    end
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
  end
}
