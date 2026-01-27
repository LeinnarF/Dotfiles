vim.opt.number = true
vim.opt.cursorline = true

-- Indentation
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Leader 
vim.g.mapleader = ' ' 
vim.g.maplocalleader = ' '

-- Keymaps
vim.keymap.set('n', '<C-b>', ':Neotree toggle<CR>', {})
vim.keymap.set('n', '<C-s>', ':w<CR>', {desc='Save File'})
vim.keymap.set('n', '<leader>q', ':q<CR>', {desc='Quit'})
vim.keymap.set('n', '<leader>nh', ':nohl<CR>', {desc='Clear search highlights'})


-- Command Pallete
vim.keymap.set('n', "<C-l>", ":", { noremap = true, silent = false, desc = "Command-line" })

-- Tab Navigation
vim.keymap.set('n', "<C-A-j>", ":tabprevious<CR>", { noremap = true, silent = true })
vim.keymap.set('n', "<C-A-l>", ":tabnext<CR>", { noremap = true, silent = true })
vim.keymap.set('n', '<leader>t', ":tabnew<CR>", { desc='New Tab', noremap = true, silent = true })


