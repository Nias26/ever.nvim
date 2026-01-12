return {
	{
		"mason-org/mason.nvim",
		event = "VeryLazy",
		build = ":MasonUpdate",
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "",
						package_pending = "󰇚",
						package_uninstalled = "",
					},
					check_outdated_packages_on_open = true,
					border = "none",
				},
			})
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = { "mason-org/mason.nvim" },
		event = "VeryLazy",
		opts = {
			ensure_installed = {
				"lua_ls",
				"rust_analyzer",
				"clangd",
				"pyright",
			},
		},
	},
}
