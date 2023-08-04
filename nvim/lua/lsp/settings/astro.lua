return {
  init_options = {
    typescript = {
      -- https://www.reddit.com/r/neovim/comments/10iixrz/comment/j706g5y/?utm_source=share&utm_medium=web2x&context=3
      -- according to this https://github.com/withastro/language-tools/issues/501
      -- the key now `tsdk` not `serverPath` anymore, and it should be the directory path, not file path
      tsdk = vim.fs.normalize "~/.local/share/nvim/mason/packages/astro-language-server/node_modules/typescript/lib"
    }
  }
}
