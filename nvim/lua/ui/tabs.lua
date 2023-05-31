return {
	"akinsho/bufferline.nvim",
	tag = "v2.*",
	-- dependencies = { { "kyazdani42/nvim-web-devicons" } },
	config = function()
		require("bufferline").setup({
			options = {
				mode = "tabs",
				separator_style = { "", "" },
				show_buffer_close_icons = false,
				show_close_icon = false,
				color_icons = true,
			},
		})
	end,
}
