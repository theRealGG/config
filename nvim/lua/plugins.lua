local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
  --
  -- ui settings
  --
  --
  require("ui.theme"),
  require("ui.statusline"),
  require("ui.file_explorer"),
  require("ui.tabs"),

  --
  -- version control
  --
  require("vc.git"),

  --
  -- treesitter
  --
  require("treesitter.treesitter"),
  require("treesitter.autotag"),
  require("treesitter.autopair"),

  -- LSP
  "neovim/nvim-lspconfig",

  --
  -- null ls
  --
  require("editor.editor_actions"),

  --
  -- snippets
  --
  require("snippets.snippets"),

  --
  -- autocompletion
  --
  require("completion.completion"),
  require("completion.saga"),
  require("completion.java"),
  {
    "akinsho/bufferline.nvim",
    tag = "v2.*",
    --  dependencies = {{"kyazdani42/nvim-web-devicons", name = "buffer-icons"}}
  },
}

require("lazy").setup(plugins, opts)
