--
-- neovim config
-- 2023
--

vim.api.nvim_exec("language en_US", true)

require("plugins")

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

--
-- general settings regarding editor behaviour
--
require("general")
--
-- keybindings
--
require("bindings.bindings")

require("plugins")
