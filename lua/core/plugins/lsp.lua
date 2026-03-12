return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = vim.tbl_deep_extend(
                "force",
                {},
                vim.lsp.protocol.make_client_capabilities(),
                require("cmp_nvim_lsp").default_capabilities()
            )

            vim.lsp.config("lua_ls", {
                settings = {
                    Lua = {
                        runtime = {
                            version = "LuaJIT",
                        },
                        diagnostics = {
                            globals = { "vim" },
                        },
                        workspace = {
                            checkThirdParty = false,
                            library = {
                                vim.env.VIMRUNTIME,
                            },
                        },
                        telemetry = {
                            enable = false,
                        },
                    },
                },
            })

            require("mason-lspconfig").setup({
                handlers = {
                    function(server_name) -- default handler (optional)
                        require("lspconfig")[server_name].setup({
                            capabilities = capabilities,
                        })
                    end,
                },
            })
            vim.diagnostic.config({
                float = {
                    focusable = false,
                    style = "minimal",
                    border = "rounded",
                    source = true,
                    header = "",
                    prefix = "",
                },
            })
        end,
    },
    { "mason-org/mason.nvim", opts = {} },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {
                "lua_ls",
                "clangd",
                "neocmake",
                "rust_analyzer",
                "ts_ls",
                "tailwindcss",
                "cssls",
            },
        },
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        dependencies = { "williamboman/mason.nvim" },
        opts = {
            ensure_installed = {
                "selene",
                "stylua",
                "clang-format",
                "cmakelang",
            },
            auto_update = false,
            run_on_start = true,
        },
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "hrsh7th/cmp-cmdline" },
            { "L3MON4D3/LuaSnip", version = "v2.*" },
        },
        opts = function(_, opts)
            local cmp = require("cmp")
            local cmp_select = { behavior = cmp.SelectBehavior.Select }
            opts.snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
                end,
            }
            opts.mapping = cmp.mapping.preset.insert({
                ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
                ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
                ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
            })
            opts.sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" }, -- For luasnip users.
                { name = "buffer" },
                { name = "path" },
                { name = "cmdline" },
            })
        end,
    },
    { "saadparwaiz1/cmp_luasnip" },
    { "j-hui/fidget.nvim", opts = {} },
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                lua = { "stylua" },
            },
            formatters = {
                stylua = {
                    prepend_args = { "--search-parent-directories" },
                },
            },
        },
    },
}
