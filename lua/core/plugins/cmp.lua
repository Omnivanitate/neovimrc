return {
    --[[
	"hrsh7th/nvim-cmp",
	dependeincies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
	},
	opts = function()
		return {
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
				end,
			},
			sources = require("cmp").config.sources({
				{ name = "luasnip" },
			}, {
				{ name = "buffer" },
				{ name = "path" },
				{ name = "cmdline" },
			}),
		}
	end,
    ]]--
}
