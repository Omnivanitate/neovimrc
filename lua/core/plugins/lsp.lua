return {
    { "mason-org/mason.nvim", opts = {} },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {
                "lua_ls",
                "clangd",
                "neocmake",
                "rust_analyzer",
                "harper_ls",
            },
            auto_update = false,
        },
        dependencies = {
            "mason-org/mason.nvim",
            "neovim/nvim-lspconfig",
        },
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        dependencies = {
            "mason-org/mason.nvim",
        },
        opts = {
            ensure_installed = {
                "selene",
                "stylua",
                "clang-format",
                "cmakelang",
            },
            auto_update = false,
            run_on_start = false,
        },
    },
    { "j-hui/fidget.nvim",    opts = {} },
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                lua = { "stylua" },
                c = { "clang-format" },
                cpp = { "clang-format" },
                h = { "clang-format" },
                hpp = { "clang-format" },
            },
            formatters = {
                stylua = {
                    prepend_args = { "--search-parent-directories" },
                },
            },
        },
    },
}
