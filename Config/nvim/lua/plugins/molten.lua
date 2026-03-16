return {
	{
		"benlubas/molten-nvim",
		version = "^1.0.0",
		build = ":UpdateRemotePlugins",
		init = function()
			-- output window settings
			vim.g.molten_output_win_max_height = 12
			vim.g.molten_auto_open_output = false
			vim.g.molten_wrap_output = true
			vim.g.molten_virt_text_output = true
			vim.g.molten_virt_lines_off_by1 = true
			vim.g.molten_image_provider = "image.nvim"
		end,
	},
	{
		"3rd/image.nvim",
		opts = {
			backend = "kitty",
			integrations = {},
			max_width = 100,
			max_height = 12,
			max_height_window_percentage = math.huge,
			max_width_window_percentage = math.huge,
			window_overlap_clear_enabled = true,
			window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
		},
	},
	{
		"goerz/jupytext.nvim",
		version = "0.2.0",
		lazy = false,
		opts = {
			format = "py:hydrogen",
			update = true,
			autosync = true,
		},
	},
}
