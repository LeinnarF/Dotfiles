# Neovim Configuration Critique and Suggestions

Here is a summary of the critique and suggestions for your Neovim configuration.

## `init.lua`

### Suggestion: Change loading order

It is generally better to load `options` first, as some plugins might depend on the options being set.

**Current `init.lua`:**
```lua
require('keymap')
require("lazy").setup('plugins')
require('options')
```

**Suggested `init.lua`:**
```lua
require('options')
require('keymap')
require("lazy").setup('plugins')
```

## `options.lua`

### Suggestion: Set `cmdheight` to 1

`cmdheight = 0` completely hides messages, errors, and command previews. It is strongly recommended to set it to 1.

**Current `options.lua`:**
```lua
vim.opt.cmdheight = 0
```

**Suggested `options.lua`:**
```lua
vim.opt.cmdheight = 1
```

### Suggestion: Move indentation settings from `keymap.lua`

Move your indentation settings to `options.lua` to keep your configuration organized.

**Add to `options.lua`:**
```lua
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.autoindent = true
vim.opt.smartindent = true
```

**Remove from `keymap.lua`:**
```lua
-- Indentation
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.autoindent = true
vim.opt.smartindent = true
```

## `keymap.lua`

### Suggestion: Review Copilot mapping

The mapping for accepting a Copilot suggestion is using a legacy method. I recommend checking the documentation of your `copilot.lua` plugin for the recommended way to map the accept key. It is also common to use the `<Tab>` key to accept suggestions.

### Suggestion: Remove redundant and commented-out mappings

Remove commented-out code to keep the configuration clean. Also, you have some redundant mappings, like two for `Find Commands` and two for `Find Buffers`.

## `completion.lua`

### Suggestion: Add more completion sources

You can add more sources to `nvim-cmp` to get more completion suggestions. For example, `cmp-path` for file paths, and `cmp-buffer` for buffer completions.

**Suggested `completion.lua`:**
```lua
return {
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		"hrsh7th/cmp-buffer",
	},
	{
		"hrsh7th/cmp-path",
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = { "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path" },
		config = function()
			-- Set up nvim-cmp.
			local cmp = require("cmp")
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body) -- For `luasnip`
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "path" },
				}, {
					{ name = "buffer" },
				}),
			})
		end,
	},
}
```

## `lsp-config.lua`

### Suggestion: Refactor LSP setup to be more DRY

You can refactor your LSP setup to be less repetitive by iterating over a list of servers.

### Suggestion: Add keymaps for LSP actions

You can add keymaps for LSP actions like `go to definition`, `find references`, `rename`, etc. in the `on_attach` function of the LSP setup.

**Suggested `lsp-config.lua`:**
```lua
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
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = { "williamboman/mason-lspconfig.nvim" },
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			capabilities.textDocument.completion.completionItem.snippetSupport = true

			local servers = {
				"lua_ls",
				"pyright",
				"html",
				"cssls",
				"tsserver",
				"texlab",
			}

			require("mason-lspconfig").setup({
				ensure_installed = servers,
			})

			local on_attach = function(client, bufnr)
				local opts = { noremap = true, silent = true }
				vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
			end

			for _, server in ipairs(servers) do
				local lspconfig = require("lspconfig")
				lspconfig[server].setup({
					on_attach = on_attach,
					capabilities = capabilities,
				})
			end

			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
						},
					},
				},
			})
		end,
	},
}
```

## `telescope.lua`

### Suggestion: Remove redundant mappings

You have some redundant mappings. For example, `<leader>fc` is mapped twice.

### Suggestion: Reconsider `<C-p>` and `<C-f>` mappings

`<C-p>` is a very common mapping for finding files. You have it mapped to `builtin.commands`. Also, `<C-f>` is mapped to finding all files, which can be slow and overrides the default scrolling behavior.

## `ui.lua`

### Suggestion: Set the `lualine` theme explicitly

It is more robust to set the `lualine` theme explicitly to `tokyonight` to match your colorscheme.

**Current `ui.lua`:**
```lua
local custom_theme = require("lualine.themes.auto")
require("lualine").setup({
    options = {
        theme = custom_theme,
        ...
    },
})
```

**Suggested `ui.lua`:**
```lua
require("lualine").setup({
    options = {
        theme = "tokyonight",
        ...
    },
})
```

### Suggestion: Try enabling scope highlighting in `indent-blankline`

The scope highlighting can be very useful for visualizing code blocks. You might want to try enabling it to see if you like it.

**Current `ui.lua`:**
```lua
{
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
        indent = { char = "│" },
        scope = { enabled = false },
    },
},
```

**Suggested `ui.lua`:**
```lua
{
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
        indent = { char = "│" },
        scope = { enabled = true },
    },
},
```

## General

### Investigate `tree.lua`

You have a file named `tree.lua` in your plugins folder. It's not clear what this file is for. I'd recommend reading this file to understand what it does.

### Consider managing your LaTeX snippets with `LuaSnip`

You have a `latex-snipet.lua` file. You could consider managing your snippets with `LuaSnip`, which you are already using. This would allow you to have all your snippets in one place and use the same engine for all of them.
