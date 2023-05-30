local common = require("common")

local status, telescope = pcall(require, "telescope")
if not status then
	return
end
telescope.setup({
	extensions = {
		file_browser = {
			--      theme = "dracula",
			-- disables netrw and use telescope-file-browser in its place
			hijack_netrw = true,
		},
	},
})

telescope.load_extension("file_browser")

-- keymaps
local builtin = require("telescope.builtin")
