local common = require("common")
local nmap = common.nmap

-- leader keys
vim.g.mapleader = " "

--
-- common bindings
--
nmap("<leader>w", ":w<CR>")
nmap("<leader>q", ":q!<>CR")

--
-- tabs
--
for i = 1, 10, 1 do
	local binding = "<leader>" .. i
	local cmd = tostring(i) .. "gt"
	nmap(binding, cmd)
end

--
-- Telescope settings
--
nmap("ff", "<cmd>Telescope find_files<cr>")
nmap("fg", "<cmd>Telescope live_grep<cr>")
nmap("fd", "<cmd>Telescope file_browser<cr>")

--
-- NvimTree
--
nmap("<leader>fb", "<cmd>NeoTreeFocusToggle<cr>")
