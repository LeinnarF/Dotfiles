return{
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({
			highlights ={
				fill = { bg = "none" },
				background = { bg = "none" },
				buffer_selected = { bg = "none", bold = true  },
				buffer_visible = { bg = "none" },
				indicator_selected = { bg = "none" },
				separator = { bg = "none"	},
				separator_selected = { bg = "none"  },
				separator_visible = { bg = "none"  },
			},
			options = {
				mode = "buffers",
				numbers = "none",
				separator_style = {"", ""},
				diagnostics = "nvim_lsp",
				show_buffer_close_icons = true,
				show_close_icon = true,
				always_show_bufferline = true,
				indicator = { 
					style = 'underline' 
				},
				offsets = {
					{
						-- filetype = "NvimTree",
						text = "File Explorer",
						highlight = "Directory",
						separator = true,
					},
				},
			},
		})
	end,
}
