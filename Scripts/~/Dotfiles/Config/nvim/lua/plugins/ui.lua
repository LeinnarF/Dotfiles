return
{
    {
        "Mofiqul/dracula.nvim",
        lazy = false,
        config = function ()
            vim.cmd.colorscheme('dracula')
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
        require("lualine").setup {
            options = { theme = "dracula" }
        }
        end,
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
        -- add any options here
            },
            dependencies = {
                -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
                "MunifTanjim/nui.nvim",
                -- OPTIONAL:
                --   `nvim-notify` is only needed, if you want to use the notification view.
                --   If not available, we use `mini` as the fallback
                "rcarriga/nvim-notify",
        }
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        ---@module "ibl"
        ---@type ibl.config
        opts = {},
    },
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            require("bufferline").setup {
                options = {
                    mode = "tabs", -- set to "tabs" to only show tabpages
                    numbers = "none",
                    separator_style = "thin", -- "slant" | "thick" | "thin"
                    diagnostics = "nvim_lsp",  -- show LSP errors/warnings in tab
                    show_buffer_close_icons = false,
                    show_close_icon = false,
                    always_show_bufferline = true,
                    offsets = {
                        {
                            filetype = "neo-tree",
                            text = "File Explorer",
                            highlight = "Directory",
                            separator = true
                        }
                    },
                }
            }
        end,
    }
}
