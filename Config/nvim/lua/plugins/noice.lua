return{
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	opts = {
		lsp = {
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
		},
		cmdline = {
			view = "cmdline_popup",
			format = {
				cmdline = { icon = "", title = "Command Line" },
				-- search_down = { icon = " ", title = "Search Down" },
				-- search_up = { icon = " ", title = "Search Up" },
				-- filter = { icon = " ", title = "Filter" },
				-- lua = { icon = " ", title = "Lua" },
				-- help = { icon = " ", title = "Help" },
			},
		},
		message = {
			enabled = true,
			view = "notify",
			view_error = "notify",
			view_warn = "notify",
			view_history = "messages",
			view_search = "virtualtext",
		},
		presets = {
			bottom_search = false,
			command_palette = true,
			long_message_to_split = true,
		},
	},
}
