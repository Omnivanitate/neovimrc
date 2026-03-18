return {
    {
        'L3MON4D3/LuaSnip',
        version = '*',
        build = "make install_jsregexp",
        dependencies = {
            'rafamadriz/friendly-snippets',
            config = function()
                require("luasnip.loaders.from_vscode").lazy_load()
                -- custom snippets
                -- require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snippets" } })
            end
        },
    },
    {
        "danymat/neogen",
        version = "*",
        dependencies = {
            'L3MON4D3/LuaSnip',
            "nvim-telescope/telescope.nvim",
        },
        opts = {
            enable = true,
            snippet_engine = "luasnip",
            input_after_comment = true,
        },
        config = function()
            require('neogen').setup({
                languages = {
                    ['cpp.doxygen'] = require('neogen.configurations.cpp')
                }
            })
        end
    }
}
