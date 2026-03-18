return {
    {
        "nvim-telescope/telescope.nvim",
        version = "*",
        opts = {},
        keys = function()
            return {
                {
                    "<leader>pf",
                    function()
                        require("telescope.builtin").find_files()
                    end,
                    {},
                },
                {
                    "<C-P>",
                    function()
                        require("telescope.builtin").git_files()
                    end,
                    {},
                },
                {
                    "<leader>pws",
                    function()
                        local word = vim.fn.expand("<cword>")
                        require("telescope.builtin").grep_string({
                            search = word,
                        })
                    end,
                    {},
                },
                {
                    "<leader>pWs",
                    function()
                        local word = vim.fn.expand("<cWORD>")
                        require("telescope.builtin").grep_string({
                            search = word,
                        })
                    end,
                    {},
                },
                {
                    "<leader>ps",
                    function()
                        require("telescope.builtin").grep_string({
                            search = vim.fn.input("Grep > "),
                        })
                    end,
                    {},
                },
                { "<leader>vh", require("telescope.builtin").help_tags, {} },
            }
        end,
    },
    { "nvim-lua/plenary.nvim", lazy = true },
}
