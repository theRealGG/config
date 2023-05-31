local common = require("common")
local nmap = common.nmap

-- leader keys
vim.g.mapleader = " "

--
-- common bindings
--
nmap("<leader>w", ":w<CR>")
nmap("<leader>q", ":q!<>CR")
nmap("<leader>f", "gg=G")

--
-- tabs
--
nmap("<leader>t", ":tabnew")

for i = 1, 10, 1 do
  local binding = "<leader>" .. i
  local cmd = tostring(i) .. "gt"
  nmap(binding, cmd)
end

--
-- NvimTree
--
nmap("<leader>fb", "<cmd>NvimTreeToggle<cr>")
nmap("<leader>ff", "<cmd>NvimTreeFocus<cr>")
