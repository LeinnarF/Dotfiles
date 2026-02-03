-- Indentation
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.autoindent = true
vim.opt.smartindent = true


-- Numbering and cursor line
vim.opt.number = true
vim.opt.cursorline = true


-- Enable mouse support
vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE"})
vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE"})


-- Disable mode display since we use lualine
vim.opt.showmode = false
vim.opt.cmdheight = 0


-- Copilot setup
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true


-- Latex setup
vim.g.vimtex_compiler_method = 'latexmk'
vim.g.vimtex_quickfix_mode = 0


-- Error lens 
vim.diagnostic.config({
	virtual_text = {
		spacing = 2,
		prefix = '',
	},
	severity_sort = true,
	float = {
		source = true
	},
	signs = {},
	update_in_insert = false,
})


-- Window splitting
vim.opt.splitright = true
vim.opt.splitbelow = true


-- Diagnostic signs
local severity = vim.diagnostic.severity
vim.diagnostic.config({
	signs = {
		text = {
			[severity.ERROR] = " ",
			[severity.WARN]  = " ",
			[severity.INFO]  = " ",
			[severity.HINT]  = " ",
		},
	}
})
