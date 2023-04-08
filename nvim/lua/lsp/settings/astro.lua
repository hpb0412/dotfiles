return {
  init_options = {
    typescript = {
      -- https://www.reddit.com/r/neovim/comments/10iixrz/comment/j706g5y/?utm_source=share&utm_medium=web2x&context=3
      serverPath = vim.fs.normalize "~/.local/share/nvim/mason/packages/astro-language-server/node_modules/typescript/lib/tsserverlibrary.js"
    }
  }
}
