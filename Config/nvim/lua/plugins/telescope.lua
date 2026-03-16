return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function ()
		local builtin = require("telescope.builtin")
		local telscope = require("telescope")

		vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live Grep' })
		vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find Buffers' })
		vim.keymap.set('n', '<leader>fH', builtin.help_tags, { desc = 'Find Help' })
		vim.keymap.set('n', '<leader>fh', builtin.command_history, { desc = 'Find Command History' })
		vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Find Keymaps' })
		vim.keymap.set('n', '<leader>bf', builtin.buffers, { desc = 'Find Buffers' })
		vim.keymap.set('n', '<leader>fc', builtin.commands, { desc = 'Find Commands' })
		vim.keymap.set('n', '<C-p>', builtin.commands, { desc = 'Find Commands' })
		
		vim.keymap.set('n', '<leader>ff', function()
			builtin.find_files({ hidden = true })
		end, { desc = 'Find Files (Including Hidden)' })

		vim.keymap.set('n', '<C-f>', function()
			builtin.find_files({ hidden = true, no_ignore = true })
		end, { desc = 'Find All Files (Hidden + Ignored)' })

		telscope.setup {
			defaults = {
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						prompt_position = "top",
						preview_width = 0.5,
						results_width = 0.5,
					},
					width = 0.9,
					height = 0.40,
					preview_cutoff = 120,
				},
				sorting_strategy = "ascending",
				winblend = 0,
				border = true,
				borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
				color_devicons = true,
				set_env = { ["COLORTERM"] = "truecolor" },
				file_ignore_patterns = { "node_modules", ".git/", "dist/", "build/" },
				path_display = { "truncate" },
				prompt_prefix = " ❯ ",
				selection_caret = " ",
				entry_prefix = " ",
			},
			pickers = {
				find_files = {
					hidden = true,
					prompt_title = "Find Files",
					results_title = "",
					preview_title = "",
				},
			},
			live_grep = {
				find_files = {
					hidden = true,
					prompt_title = "",
					results_title = "",
					preview_title = "",
				},
			},
		}

		local border = { fg = "#c0caf5" }
		local groups = {
			"TelescopeBorder",
			"TelescopePromptBorder",
			"TelescopeResultsBorder",
			"TelescopePreviewBorder",
			"TelescopePromptTitle",
		}

		for _, g in ipairs(groups) do
			vim.api.nvim_set_hl(0, g, border)
		end
	end
}
