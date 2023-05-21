-- file Settings
-- ---------------------------------------
-- show line number
vim.wo.number = true

-- set encoding
vim.opt.encoding = "utf-8"

vim.opt.swapfile = false

-- Tab set to two spaces
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

vim.opt.termguicolors = true

-- Give me space
vim.opt.signcolumn = "yes"

require("plugins")
require("completion")
require("autotag")
require("autopair")
require("statusline")
require("treesitter")
require("file_explorer")
require("tabs")
require("editor_actions")
require("startpage")
require("saga")

-- theme
vim.cmd([[colorscheme dracula]])

function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
  map("n", shortcut, command)
end

-- map to insert mode
function imap(shortcut, command)
  map("i", shortcut, command)
end

nmap("ff", "<cmd>Telescope find_files<cr>")
nmap("fg", "<cmd>Telescope live_grep<cr>")
nmap("fd", "<cmd>Telescope file_browser<cr>")
