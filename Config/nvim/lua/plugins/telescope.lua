return {
    "nvim-telescope/telescope.nvim", 
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function ()
        local builtin = require("telescope.builtin")
        vim.keymap.set('n', '<C-p>', function()
	    builtin.find_files({hidden=true,no_ignore=true}) 
        end, {})
    end
}