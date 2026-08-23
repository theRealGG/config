-- bootstrap lazy.nvim, LazyVim and your plugins

vim.env.PATH = "/opt/homebrew/bin:" .. vim.env.PATH

if vim.loader then
  vim.loader.enable()
end

require("config.lazy")
