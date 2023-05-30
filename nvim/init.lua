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
-- treesitter settings
--
require("treesitter.treesitter")
require("treesitter.autotag")
require("treesitter.autopair")

--
-- ui settings
--
require("ui.file_explorer")
require("ui.tabs")
require("ui.statusline")
require("ui.statusline")
require("ui.startpage")
require("ui.theme")
require("ui.code_signs")

--
-- autocompletion
--
require("completion.completion")
require("completion.saga")

--
-- snippets
--
require("snippets.snippets")

--
-- keybindings
--
require("bindings.bindings")

--
-- general editor settings for for formatting and other useful features
--
require("editor.editor_actions")
require("editor.prettier")

require("ui.file_tree")
