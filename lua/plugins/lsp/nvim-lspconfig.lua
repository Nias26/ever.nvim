return {
	"neovim/nvim-lspconfig",
	event = "BufReadPost",
	dependencies = { "saghen/blink.cmp" },
	init = function()
		-- Enable lsp servers
		vim.lsp.enable({ "lua_ls", "clangd", "cmake", "java_language_server" })
	end,
	config = function()
		local lsp = vim.lsp

		vim.diagnostic.config({
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = " ",
					[vim.diagnostic.severity.WARN] = " ",
					[vim.diagnostic.severity.HINT] = "󰌵 ",
					[vim.diagnostic.severity.INFO] = "󱈸 ",
				},
			},
		})

		-- Servers Configuration
		local capabilities = require("blink.cmp").get_lsp_capabilities()

		local on_attach = function(client, bufnr)
			if client:supports_method("textDocument/documentSymbolProvider") then
				require("nvim-navic").attach(client, bufnr)
			end
		end

		-- Config
		lsp.config("lua_ls", {
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				Lua = {
					completion = {
						callSnippet = "Replace",
					},
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true),
					},
				},
			},
		})

		lsp.config("clangd", {
			capabilities = capabilities,
			on_attach = on_attach,
			root_markers = { "*.cpp", "*.h", "*.hpp" },
		})

		lsp.config("cmake", {
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lsp.config("java_language_server", {
			capabilities = capabilities,
			on_attach = on_attach,
		})
	end,
}
