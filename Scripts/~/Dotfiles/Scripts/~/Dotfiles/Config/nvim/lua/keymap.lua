vim.opt.number = true
vim.opt.cursorline = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

vim.opt.autoindent = true
vim.opt.smartindent = true


vim.keymap.set('n', '<C-b>', ':Neotree toggle<CR>', {})
vim.keymap.set('n', '<C-s>', ':w<CR>', {})

-- Command Pallete
vim.keymap.set('n', "<C-l>", ":", { noremap = true, silent = false, desc = "Command-line" })

-- Tab Navigation
vim.keymap.set('n', "<C-A-j>", ":tabprevious<CR>", { noremap = true, silent = true })
vim.keymap.set('n', "<C-A-l>", ":tabnext<CR>", { noremap = true, silent = true })
vim.keymap.set('n', '<C-A-k>', ":tabnew<CR>", { noremap = true, silent = true })
