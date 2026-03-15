local map = vim.keymap.set

-- Auto indent 
map('v', '<', '<gv', { desc='Indent Left', silent = true })
map('v', '>', '>gv', { desc='Indent Right', silent = true })


-- Leader 
vim.g.mapleader = ' '
vim.g.maplocalleader = " "


-- General Keymaps
map('n', '<leader>e', ':Neotree toggle<CR>', {desc='Toggle File Explorer', silent = true})
map('n', 'H', '^', { desc='Beginning of Line' })
map('n', 'L', '$', { desc='End of Line' })
map('v', 'H', '^', { desc='Beginning of Line' })
map('v', 'L', '$', { desc='End of Line' })
map('i', 'jk', '<Esc>', { desc='Exit Insert Mode' })
map('n', '<esc>', '<cmd>noh<CR>', { desc='Clear Search Highlight', silent = true })


-- Vanilla Vim Enhancements 
map({'n','i','v'}, '<C-s>', '<Esc>:w<CR>', {desc='Save File', silent = true})
map({'n','i','v'}, '<C-a>', '<Esc>ggVG', { desc='Select All', silent = true })
map({'n','i','v'}, '<C-c>', '"+y', { desc='Copy to Clipboard', silent = true })


-- Command Pallete
map({'n','v'}, "<C-l>", ":", { noremap = true, silent = false, desc = "Command-line" })
map('n', "<leader>cc", ":", { noremap = true, silent = false, desc = "Command-line" })
map('n', "<leader>ch", ":h ", { noremap = true, silent = false, desc = "Help" })


-- Buffers
map('n', "<C-A-l>", ':bn<CR>', { desc='Next Buffer' , silent = true})
map('n', "<C-A-j>", ':bp<CR>', { desc='Previous Buffer' , silent = true})
map('n', '<leader>bc', ':bdelete<CR>', { desc='Close Buffer' , silent = true})
map('n', '<A-w>', ':bdelete<CR>', { desc='Close Buffer' , silent = true})
map('n', '<C-t>', ':enew<CR>', { desc='Add Buffer', silent = true })


-- Window Operations
map('n', '<leader>wv', '<C-w>v', { desc='Split Window Vertically', silent = true })
map('n', '<leader>wh', '<C-w>s', { desc='Split Window Horizontally', silent = true })
map('n', '<leader>we', '<C-w>=', { desc='Equalize Window Sizes', silent = true })
map('n', '<leader>wc', ':close<CR>', { desc='Close Current Window', silent = true })
map('n', '<leader>ww','<C-w>w',{ desc='Switch Window', silent = true})
map('n', '<leader><Tab>','<C-w>w',{ desc='Switch Window', silent = true})
map('n', '<leader>wl', '<C-w>L', { desc='Move Window to the Right', silent = true })
map('n', '<leader>wj', '<C-w>H', { desc='Move Window to the Left' , silent = true})


-- Resize Windows
map('n', '<C-Up>', ':resize +2<CR>', { desc='Increase Window Height', silent = true })
map('n', '<C-Down>', ':resize -2<CR>', { desc='Decrease Window Height', silent = true })
map('n', '<C-Left>', ':vertical resize -2<CR>', { desc='Decrease Window Width', silent = true })
map('n', '<C-Right>', ':vertical resize +2<CR>', { desc='Increase Window Width', silent = true })


-- Move Lines
map('n', '<A-j>', ':m .+1<CR>==', { desc='Move Line Down', silent = true })
map('n', '<A-k>', ':m .-2<CR>==', { desc='Move Line Up', silent = true })
map('i', '<A-j>', '<Esc>:m .+1<CR>==gi', { desc='Move Line Down', silent = true })
map('i', '<A-k>', '<Esc>:m .-2<CR>==gi', { desc='Move Line Up', silent = true })
map('v', '<A-j>', ":m '>+1<CR>gv=gv", { desc='Move Line Down', silent = true })
map('v', '<A-k>', ":m '<-2<CR>gv=gv", { desc='Move Line Up', silent = true })


-- LSP Keymaps 
map('n', 'gd', vim.lsp.buf.definition, { desc='Go to Definition', silent = true })
map('n', 'gr', vim.lsp.buf.references, { desc='List References', silent = true })
map('n', '<leader>ca', vim.lsp.buf.code_action, { desc='Code Action', silent = true })


-- Terminal Keymaps
map('n', '<leader>tt', ':terminal<CR>', { desc='Open Terminal', silent = true })
map('n', '<leader>tv', ':vsplit | terminal<CR>', { desc='Open Terminal Vertically', silent = true })
map('n', '<leader>th', ':split | terminal<CR>', { desc='Open Terminal Horizontally', silent = true })
map('t', '<Esc>', '<C-\\><C-n>', { desc='Exit Terminal Mode', silent = true })


-- Diagnostics Keymaps
map('n', '<leader>d', vim.diagnostic.open_float, { desc='Show Diagnostic', silent = true })
map('n', '<leader>cl', vim.diagnostic.setloclist, { desc='Set Location List', silent = true })


-- Molten
map("n", "<localleader>mi", ":MoltenInit python3<CR>", { desc = "Init kernel" })
map("n", "<localleader>me", ":MoltenEvaluateOperator<CR>", { desc = "Eval operator" })
map("n", "<localleader>ml", ":MoltenEvaluateLine<CR>", { desc = "Eval line" })
map("v", "<localleader>me", ":<C-u>MoltenEvaluateVisual<CR>", { desc = "Eval selection" })
map("n", "<localleader>mr", ":MoltenReevaluateCell<CR>", { desc = "Re-eval cell" })
map("n", "<localleader>mo", ":noautocmd MoltenEnterOutput<CR>", { desc = "Enter output" })
map("n", "<localleader>md", ":MoltenDelete<CR>", { desc = "Delete cell" })

