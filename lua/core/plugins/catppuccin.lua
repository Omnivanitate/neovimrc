return {
    "catppuccin/nvim", 
    name = "catppuccin",
    priority = 1000,
    opts  = {
        flavour = "macchiato",
        background= {
            light = "latte",
            dark="frappe",
        },
        transparent_background = false,
        styles = {
            functions = {"italic"},
            keywords = {"bold"},
        }
    },
    config = function(_, opts)
        require("catppuccin").setup(opts)
        vim.cmd.colorscheme "catppuccin"
    end
}


