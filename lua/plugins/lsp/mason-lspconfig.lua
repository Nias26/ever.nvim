return {
	"williamboman/mason-lspconfig.nvim",
	event = "VeryLazy",
	dependencies = {
		"williamboman/mason.nvim",
		"neovim/nvim-lspconfig",
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				lsp = { "lua_ls", "clangd" },
				linter = { "luacheck", "cpplint" },
				formatter = { "stylua", "clang-format" },
			},
		})
		capabilities = require("cmp_nvim_lsp").default_capabilities()
		on_attach = function(client, bufnr)
			require("nvim-navic").attach(client, bufnr)
		end

		local lspconfig = require("lspconfig")
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				Lua = {
					completion = {
						callSnippet = "Replace",
					},
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = { "vim" },
					},
				},
			},
		})

		lspconfig.clangd.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			root_dir = lspconfig.util.root_pattern("*.cpp"),
		})

		lspconfig.eslint.setup({
			capabilities = capabilities,
			-- on_attach = on_attach,
			root_dir = lspconfig.util.root_pattern("*.js"),
		})

		--[[ require("mason-lspconfig").setup_handlers {
			-- The first entry (without a key) will be the default handler
			-- and will be called for each installed server that doesn't have
			-- a dedicated handler.
			function(server_name) -- Default handler (Optional)
				require("lspconfig")[server_name].setup {
					capabilities = capabilities,
					on_attach = on_attach
				}
			end
		} ]]
	end,
}
