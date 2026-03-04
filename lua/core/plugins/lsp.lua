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
    {"mason-org/mason.nvim", opts = {}},
    {"mason-org/mason-lspconfig.nvim", opts = {
        ensure_installed = {
            "lua_ls",
            "clangd",
            "rust_analyzer",
            "ts_ls",
            "tailwindcss",
            "cssls",
        },
    }},
    {
        "hrsh7th/nvim-cmp", opts = function(_, opts) 
            local cmp = require('cmp')
            opts.snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            }
            opts.mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp.SelectBehavior.Select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp.SelectBehavior.Select),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
            })
            opts.sources =
            {{
                { name = 'nvim_lsp' },
                { name = 'luasnip' }, -- For luasnip users.
            }, {
                { name = 'buffer' },
                { name = 'path' },
                { name = 'cmdline' },
            }}
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
