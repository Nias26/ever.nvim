return {
	"neovim/nvim-lspconfig",
	lazy = true,
	event = "BufReadPost",
	dependencies = { "saghen/blink.cmp" },
	opts = {
		inlay_hints = { enabled = true },
	},
	config = function()
		local lspconfig = require("lspconfig")

		local signs = { Error = " ", Warn = " ", Hint = "󰌵 ", Info = "󱈸 " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
		end

		-- Servers Configuration
		local capabilities = require("blink.cmp").get_lsp_capabilities()

		local on_attach = function(client, bufnr)
			require("nvim-navic").attach(client, bufnr)
		end

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
			root_dir = lspconfig.util.root_pattern("*.c", "*.cpp", "*.h", "*.hpp"),
		})

		lspconfig.pyright.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig.cmake.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})
	end,
}
