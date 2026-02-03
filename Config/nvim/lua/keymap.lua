
-- Auto indent 
vim.keymap.set('v', '<', '<gv', { desc='Indent Left', silent = true })
vim.keymap.set('v', '>', '>gv', { desc='Indent Right', silent = true })
-- vim.keymap.set({'n','i', 'v'}, '<leader>fv', '<Esc>ggVG=', { desc='Auto Indent File', silent = true })


-- Leader 
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


-- General Keymaps
vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', {desc='Toggle File Explorer', silent = true})
vim.keymap.set('n', '<leader>q', ':q<CR>', {desc='Quit', silent = true})
vim.keymap.set('n', '<A-q>', ':q<CR>', {desc='Quit', silent = true})
vim.keymap.set('n', 'H', '^', { desc='Beginning of Line' })
vim.keymap.set('n', 'L', '$', { desc='End of Line' })
vim.keymap.set('v', 'H', '^', { desc='Beginning of Line' })
vim.keymap.set('v', 'L', '$', { desc='End of Line' })


-- Vanilla Vim Enhancements 
vim.keymap.set({'n','i','v'}, '<C-s>', '<Esc>:w<CR>', {desc='Save File', silent = true})
vim.keymap.set({'n','i','v'}, '<C-a>', '<Esc>ggVG', { desc='Select All', silent = true })
vim.keymap.set({'n','i','v'}, '<C-c>', '"+y', { desc='Copy to Clipboard', silent = true })


-- Command Pallete
vim.keymap.set({'n','v'}, "<C-l>", ":", { noremap = true, silent = false, desc = "Command-line" })
vim.keymap.set('n', "<leader>cc", ":", { noremap = true, silent = false, desc = "Command-line" })
vim.keymap.set('n', "<leader>ch", ":h ", { noremap = true, silent = false, desc = "Help" })


-- Tabs
-- vim.keymap.set('n', "<C-A-j>", ":tabprevious<CR>", { noremap = true, silent = true })
-- vim.keymap.set('n', "<C-A-l>", ":tabnext<CR>", { noremap = true, silent = true })
-- vim.keymap.set('n', '<C-t>', ":tabnew<CR>", { desc='New Tab', noremap = true, silent = true })
-- vim.keymap.set('n', '<leader>x', ":tabclose<CR>", { desc='Close Tab', noremap = true, silent = true })


-- Buffers
vim.keymap.set('n', "<C-A-l>", ':bn<CR>', { desc='Next Buffer' , silent = true})
vim.keymap.set('n', "<C-A-j>", ':bp<CR>', { desc='Previous Buffer' , silent = true})
vim.keymap.set('n', '<leader>bc', ':bdelete<CR>', { desc='Close Buffer' , silent = true})
vim.keymap.set('n', '<A-w>', ':bdelete<CR>', { desc='Close Buffer' , silent = true})
vim.keymap.set('n', '<C-t>', ':enew<CR>', { desc='Add Buffer', silent = true })


-- Copilot 
vim.keymap.set('n', '<leader>cp', ':Copilot panel<CR>|<C-w>L', { desc='Open Copilot panel', silent = true })
vim.api.nvim_set_keymap('i', '<C-l>', 'copilot#Accept("<CR>")', { silent = true, expr = true, desc='Accept Copilot Suggestion' })
vim.keymap.set("i", "<A-l>", "<Plug>(copilot-accept-word)", { silent = true })
vim.keymap.set("i", "<A-S-l>", "<Plug>(copilot-accept-line)", { silent = true })


-- Window Operations
vim.keymap.set('n', '<leader>wv', '<C-w>v', { desc='Split Window Vertically', silent = true })
vim.keymap.set('n', '<leader>wh', '<C-w>s', { desc='Split Window Horizontally', silent = true })
vim.keymap.set('n', '<leader>we', '<C-w>=', { desc='Equalize Window Sizes', silent = true })
vim.keymap.set('n', '<leader>wc', ':close<CR>', { desc='Close Current Window', silent = true })
vim.keymap.set('n', '<leader>ww','<C-w>w',{ desc='Switch Window', silent = true})
vim.keymap.set('n', '<leader><Tab>','<C-w>w',{ desc='Switch Window', silent = true})
vim.keymap.set('n', '<leader>wl', '<C-w>L', { desc='Move Window to the Right', silent = true })
vim.keymap.set('n', '<leader>wj', '<C-w>H', { desc='Move Window to the Left' , silent = true})


-- Resize Windows
vim.keymap.set('n', '<C-Up>', ':resize +2<CR>', { desc='Increase Window Height', silent = true })
vim.keymap.set('n', '<C-Down>', ':resize -2<CR>', { desc='Decrease Window Height', silent = true })
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', { desc='Decrease Window Width', silent = true })
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', { desc='Increase Window Width', silent = true })


-- Move Lines
vim.keymap.set('n', '<A-j>', ':m .+1<CR>==', { desc='Move Line Down', silent = true })
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==', { desc='Move Line Up', silent = true })
vim.keymap.set('i', '<A-j>', '<Esc>:m .+1<CR>==gi', { desc='Move Line Down', silent = true })
vim.keymap.set('i', '<A-k>', '<Esc>:m .-2<CR>==gi', { desc='Move Line Up', silent = true })
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv", { desc='Move Line Down', silent = true })
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv", { desc='Move Line Up', silent = true })


-- Cheat Sheet
local cheat_sheet_path = '~/.config/nvim/nvim_cheatsheet.md'
vim.keymap.set('n', '<leader>cs', function()
	vim.cmd.edit(cheat_sheet_path)
end, { desc='Open Cheat Sheet', silent = true })


-- LSP Keymaps 
vim.keymap.set('n', '<leader>cd', vim.lsp.buf.definition, { desc='Go to Definition', silent = true })
vim.keymap.set('n', '<leader>ch', vim.lsp.buf.hover, { desc='Hover Documentation', silent = true })
vim.keymap.set('n', '<leader>ci', vim.lsp.buf.implementation, { desc='Go to Implementation', silent = true })
vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, { desc='Rename Symbol', silent = true })
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc='Code Action', silent = true })
vim.keymap.set('n', '<leader>cR', vim.lsp.buf.references, { desc='List References', silent = true })


-- Terminal Keymaps
vim.keymap.set('n', '<leader>tt', ':terminal<CR>', { desc='Open Terminal', silent = true })
vim.keymap.set('n', '<leader>tv', ':vsplit | terminal<CR>', { desc='Open Terminal Vertically', silent = true })
vim.keymap.set('n', '<leader>th', ':split | terminal<CR>', { desc='Open Terminal Horizontally', silent = true })
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc='Exit Terminal Mode', silent = true })


-- Diagnostics Keymaps
vim.keymap.set('n', '<leader>cD', vim.diagnostic.open_float, { desc='Show Diagnostic', silent = true })
vim.keymap.set('n', '<leader>cl', vim.diagnostic.setloclist, { desc='Set Location List', silent = true })

