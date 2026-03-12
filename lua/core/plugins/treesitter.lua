return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    opts = {
        install_dir = vim.fn.stdpath("data") .. "/site",
        ensured_installed = {
            "rust",
            "c",
            "cpp",
            "lua",
            "bash",
        },
        sync_install = false,
        auto_install = true,
        indent = {
            enable = true,
        },
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = { "markdown" },
        },
    },
}
