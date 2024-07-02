return {
	"williamboman/mason-lspconfig.nvim",
	lazy = true,
	event = "BufRead",
	dependencies = {
		"williamboman/mason.nvim",
		"neovim/nvim-lspconfig",
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				lsp = { "lua_ls", "clangd" },
				formatter = { "stylua", "clang-format" },
			},
		})
	end,
}
