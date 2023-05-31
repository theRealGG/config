return {
  "glepnir/lspsaga.nvim",
  config = function()
    require("lspsaga").setup({
      server_filetype_map = {
        typescript = "typescript",
        python = "python",
        lua = "lua",
      },
    })
  end,
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
    --Please make sure you install markdown and markdown_inline parser
    { "nvim-treesitter/nvim-treesitter" },
  },
  event = "LspAttach",
  keys = {
    { "<C-J>", "<Cmd>Lspsaga diagnostic_jump_next<CR>", desc = "Diagnostic jump next" },
    { "K",     "<Cmd>Lspsaga hover_doc<CR>",            desc = "Hover doc" },
    { "gd",    "<Cmd>Lspsaga lsp_finder<CR>",           desc = "Lsp finder" },
    { "<C-k>", "<Cmd>Lspsaga signature_help<CR>",       desc = "Signature Help" },
    { "gp",    "<Cmd>Lspsaga preview_definition<CR>",   desc = "Preview Definition" },
    { "gr",    "<Cmd>Lspsaga rename<CR>",               desc = "rename" },
  },
}
