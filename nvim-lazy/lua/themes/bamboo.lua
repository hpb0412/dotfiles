return {
  'ribru17/bamboo.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    local status_ok, bamboo = pcall(require, "bamboo")
    bamboo.setup {
      -- optional configuration here
    }
    bamboo.load()
  end,
}
