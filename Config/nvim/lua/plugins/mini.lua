return {
	'nvim-mini/mini.nvim',
	version = false,
	config = function()
		require('mini.indentscope').setup()
		require('mini.pairs').setup()
		require('mini.comment').setup()
		require('mini.surround').setup()
		require('mini.tabline').setup()
		require('mini.cmdline').setup({
			window = {
				config = {
					border = 'single',
				},
			},
			completion = {
				fuzzy = true,
				delay = {
					completion = 80,
					info = 200
				}
			},
		})

		local hipatterns = require('mini.hipatterns')
		hipatterns.setup({
			highlighters = {
				fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
				hack  = { pattern = '%f[%w]()HACK()%f[%W]',  group = 'MiniHipatternsHack'  },
				todo  = { pattern = '%f[%w]()TODO()%f[%W]',  group = 'MiniHipatternsTodo'  },
				note  = { pattern = '%f[%w]()NOTE()%f[%W]',  group = 'MiniHipatternsNote'  },
				hex_color = hipatterns.gen_highlighter.hex_color(),
			},
		})
	end,
}
