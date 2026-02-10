return {
	{
		"mason-org/mason.nvim",
		cmd = "Mason",
		build = ":MasonUpdate",
		opts = {
			ui = {
				icons = {
					package_installed = "",
					package_pending = "󰇚",
					package_uninstalled = "",
				},
				check_outdated_packages_on_open = true,
				border = "none",
			},
		},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		-- event = { "BufReadPost", "BufWritePost", "BufNewFile" },
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
