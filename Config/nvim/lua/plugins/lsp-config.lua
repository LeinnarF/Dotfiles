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
		lazy = false,
		opts = {
			auto_install = true,
		},
		config = function ()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"pyright",
					"html",
					"cssls",
					"ts_ls",
					"texlab",
					"clangd",
					"bashls",
					"jsonls",
					"yamlls",
					"ltex",
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
				vim.lsp.config.texlab = {capabilities = capabilities}
				vim.lsp.config.clangd = {capabilities = capabilities}
				vim.lsp.config.bashls = {capabilities = capabilities}
				vim.lsp.config.jsonls = {capabilities = capabilities}
				vim.lsp.config.yamlls = {capabilities = capabilities}

				vim.lsp.config.ltex = {
					capabilities = capabilities,
					filetypes = {"tex", "latex", "bib", "markdown", "plaintex"},
					settings = {
						ltex = {
							language = "en-US",
						}
					}
				}

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



