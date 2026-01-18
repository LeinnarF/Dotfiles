return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		config = function ()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"pyright",
					"html",
					"cssls",
					"ts_ls"
				},
			})
		end,
	},

	{
		"neovim/nvim-lspconfig",
			config = function ()
				local capabilities = require("cmp_nvim_lsp").default_capabilities()
				capabilities.textDocument.completion.completionItem.snippetSupport = true

				if vim.lsp.config then
					vim.lsp.config.html = {capabilities = capabilities}
					vim.lsp.config.cssls = {capabilities = capabilities}
					vim.lsp.config.ts_ls = {capabilities = capabilities}
					vim.lsp.config.pyright = {capabilities = capabilities}
					
					vim.lsp.config.lua_ls = {
						capabilities = capabilities,
						settings = {
							Lua = {
								diagnostics = {global = {"vim"}},
								workspace = {library = vim.api.nvim_get_runtime_file("",true)}
						}
					}
				}

				end
			end
	},
}

