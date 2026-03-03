return {
    {"neovim/nvim-lspconfig",
        config = function() 
            vim.diagnostic.config({
                -- update_in_insert = true,
                float = {
                    focusable = false,
                    style = "minimal",
                    border = "rounded",
                    source = "always",
                    header = "",
                    prefix = "",
                },
            })
        end
    },
    {"mason-org/mason.nvim"},
    {"mason-org/mason-lspconfig.nvim"},
    {
        "hrsh7th/nvim-cmp", opts = function(_, opts) 
            opts.snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            }
            opts.mapping = { present = {
                    ['<C-p>'] = opts.mapping.select_prev_item(cmp.SelectBehavior.Select),
                    ['<C-n>'] = opts.mapping.select_next_item(cmp.SelectBehavior.Select),
                    ['<C-y>'] = opts.mapping.confirm({ select = true }),
                    ["<C-Space>"] = opts.mapping.complete(),
                    ['<C-e>'] = opts.mapping.abort(),
                }
            }
            table.insert(opts.sources,
            {{
                { name = 'nvim_lsp' },
                { name = 'luasnip' }, -- For luasnip users.
            }, {
                { name = 'buffer' },
                { name = 'path' },
                { name = 'cmdline' },
            }})
        end 
    },
    {"hrsh7th/cmp-nvim-lsp"},
    {"hrsh7th/cmp-buffer"},
    {"hrsh7th/cmp-path"},
    {"hrsh7th/cmp-cmdline"},
    {"L3MON4D3/LuaSnip", version = "v2.*"},
    {"saadparwaiz1/cmp_luasnip"},
    {"j-hui/fidget.nvim", opts = {}},
    { 'stevearc/conform.nvim', opts = {}},
}
