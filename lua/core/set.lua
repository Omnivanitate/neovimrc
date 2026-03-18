vim.lsp.enable({
	"lua_ls",
	"clangd",
	"rust_analyzer",
	"harper-ls",
})

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.local/state/nvim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"
vim.opt.clipboard = "unnamedplus"

-- Rounded borders
vim.opt.winborder = "rounded"

-- Inline hints
vim.diagnostic.config({
	signs = {
		-- text = {
		-- 	[vim.diagnostic.severity.ERROR] = "󰅚",
		-- 	[vim.diagnostic.severity.WARN] = "󰀪",
		-- 	[vim.diagnostic.severity.HINT] = "󰌶",
		-- 	[vim.diagnostic.severity.INFO] = "",
		-- },
		linehl = {
			[vim.diagnostic.severity.ERROR] = "Error",
			[vim.diagnostic.severity.WARN] = "Warn",
			[vim.diagnostic.severity.INFO] = "Info",
			[vim.diagnostic.severity.HINT] = "Hint",
		},
	},
	virtual_text = true,
	virtual_lines = false,
	update_in_insert = true, -- potential perf problem?
	jump = {
		float = true,
	},
	-- virtual_lines = {
	--     current_line = true,
	-- },
})
