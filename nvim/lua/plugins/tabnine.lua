return {
  'codota/tabnine-nvim', -- AI code generator
  build = "./dl_binaries.sh",
  config = function()
    local status_ok, tabnine = pcall(require, "tabnine")
    if not status_ok then
      return
    end

    tabnine.setup {
      disable_auto_comment = true,
      accept_keymap = "<Tab>",
      dismiss_keymap = "<C-]>",
      debounce_ms = 800,
      suggestion_color = { gui = "#808080", cterm = 244 },
      exclude_filetypes = { "TelescopePrompt" }
    }
  end
}
