return{
	"tyru/open-browser.vim",
	config = function ()
		vim.keymap.set('n', '<leader>B', function ()
			vim.cmd("OpenBrowser " .. vim.fn.expand("%:p"))
		end, {desc="Open current file in browser"})
	end,
}
