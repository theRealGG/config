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
  "wbthomason/packer.nvim",
  "Mofiqul/dracula.nvim",
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", lazy = true, name = "buffer-icons" },
  },
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    tag = "v<CurrentMajor>.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!:).
    build = "make install_jsregexp"
  },
  {
    "lewis6991/gitsigns.nvim",
     config = function()
      require("gitsigns").setup()
    end,
  },
  "mfussenegger/nvim-jdtls",
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
  "windwp/nvim-ts-autotag",
  "windwp/nvim-autopairs",
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.1",
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { {"nvim-telescope/telescope.nvim"}, {"nvim-lua/plenary.nvim"} },
  },
  "nvim-tree/nvim-web-devicons",
  "nvim-lua/plenary.nvim",
  -- LSP
  "neovim/nvim-lspconfig",
  "jose-elias-alvarez/null-ls.nvim",
  "MunifTanjim/prettier.nvim",
  "onsails/lspkind-nvim",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/nvim-cmp",
  "hrsh7th/vim-vsnip",
  "hrsh7th/vim-vsnip-integ",
  "nvim-lua/popup.nvim",
  {
    "startup-nvim/startup.nvim",
    dependencies = { {"nvim-telescope/telescope.nvim"}, {"nvim-lua/plenary.nvim"} },
    config = function()
      require("startup").setup({ theme = "dashboard" })
    end,
  },
  "lewis6991/gitsigns.nvim",
  { 
    "akinsho/bufferline.nvim", 
    tag = "v2.*", 
  --  dependencies = {{"kyazdani42/nvim-web-devicons", name = "buffer-icons"}} 
  },
  {
    "glepnir/lspsaga.nvim",
    config = function()
      require("lspsaga").setup({})
    end,
    event = "LspAttach"
 }
}


require("lazy").setup(plugins, opts)
