return {
  "folke/ts-comments.nvim",
  opts = {},
  event = "VeryLazy",
  enabled = vim.fn.has("nvim-0.10.0") == 1,
  config = function()
    local status, tscomments = pcall(require, 'ts-comments')
    if not status then
      vim.notify('ts-comments failed to load')
    end

    tscomments.setup()
  end
}
