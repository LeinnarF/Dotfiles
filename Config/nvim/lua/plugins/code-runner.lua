return {
	"CRAG666/code_runner.nvim",
	config = function ()
		require("code_runner").setup({
			filetype = {
				python = "python3 -u",
			}
		})
	vim.keymap.set('n', '<C-A-n>', ':RunCode<CR>', {noremap=true, silent=false, desc="Run Code"})

	end
}
