return {
    "catppuccin/nvim", 
    name = "catppuccin",
    config = function()

        require("catppuccin").setup({
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
		})
		vim.cmd.colorscheme "catppuccin"

    end
}


