return {
	"OXY2DEV/markview.nvim",
	lazy = false,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",  -- fixed org name
	},
	config = function()
		require("markview").setup({
			preview = {
				enable = true,
				icon_provider = "devicons",
			},
			markdown = {
				headings = {
					org_indent = false,
					org_indent_wrap = true,
					org_shift_char = " ",
					org_shift_width = 0,
					heading_1 = { shift_width = 0 },
					heading_2 = { shift_width = 0 },
					heading_3 = { shift_width = 0 },
					heading_4 = { shift_width = 0 },
					heading_5 = { shift_width = 0 },
					heading_6 = { shift_width = 0 },
				},
				code_blocks = {
					enable = true,
					style = "simple",
					sign = false,

					border_hl = "MarkviewCode",
					info_hl = "MarkviewCodeInfo",

					label_direction = "right",
					label_hl = "MarkviewCodeLabel",

					min_width = 30,
					pad_amount = 2,
					pad_char = " ",

					default = {
						block_hl = "MarkviewCode",
						pad_hl = "MarkviewCode",
					},
				},
				tables = {},
				list_items = {},
				block_quotes = {},
			},
			markdown_inline = {
				checkboxes = {},
				hyperlinks = {},
				inline_codes = {},
			},
		})
	end,
}
