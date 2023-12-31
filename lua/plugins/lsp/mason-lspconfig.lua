return {
	"williamboman/mason-lspconfig.nvim",
	event = "VeryLazy",
	dependencies = {
		"williamboman/mason.nvim",
		"neovim/nvim-lspconfig"
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup {
			ensure_installed = { 'lua_ls', 'clangd', 'bashls' },
		}

		require("mason-lspconfig").setup_handlers {
			-- The first entry (without a key) will be the default handler
			-- and will be called for each installed server that doesn't have
			-- a dedicated handler.
			function(server_name) -- Default handler (Optional)
				require("lspconfig")[server_name].setup {
					capabilities = capabilities,
					on_attach = on_attach
				}
				local capabilities = require("cmp_nvim_lsp").default_capabilities()
			end,

			require('lspconfig').lua_ls.setup {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" }
						},
						workspace = {
							checkThirdParty = false,
						},
					}
				}
			}
		}
	end
}
