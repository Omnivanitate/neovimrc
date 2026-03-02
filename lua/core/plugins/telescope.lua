return {{
     'nvim-telescope/telescope.nvim', version = '*', opts = {},
    keys = {
        {'<leader>pf', require("telescope.builtin").find_files, {}},
        {'<C-p>', require("telescope.builtin").git_files, {}},
        {'<leader>pws', function()
            local word = vim.fn.expand("<cword>")
            require("telescope.builtin").grep_string({ search = word })
        end, {}},
        {'<leader>pWs', function()
            local word = vim.fn.expand("<cWORD>")
            require("telescope.builtin").grep_string({ search = word })
        end, {}},
        {'<leader>ps', function()
            require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
        end, {} },
        {'<leader>vh', require("telescope.builtin").help_tags, {} },
    }},
    { "nvim-lua/plenary.nvim", lazy = true }
}
