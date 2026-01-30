-- Indentation
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.number = true
vim.opt.cursorline = true

vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE"})
vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE"})

vim.opt.showmode = false
vim.opt.cmdheight = 0

vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true 

-- Latex setup
vim.g.vimtex_compiler_method = 'latexmk' 
vim.g.vimtex_quickfix_mode = 0

