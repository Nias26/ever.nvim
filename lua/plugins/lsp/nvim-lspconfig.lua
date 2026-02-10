return {
	-- FIX: Lazyload on file not working. Lsp autocmd wont be triggered if created after file is read.
	-- LazyVim still manages to load it on file
	-- Try to get the names from mason-lspconfig and run `vim.lsp.enable` manually
	"neovim/nvim-lspconfig",
	-- event = { "BufReadPost", "BufWritePost", "BufNewFile" },
	dependencies = {
		"mason-org/mason-lspconfig.nvim",
		"mason-org/mason.nvim",
	},
	config = function()
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

		local capabilities = require("blink.cmp").get_lsp_capabilities()
		local on_attach = function(client, bufnr)
			if client:supports_method("textDocument/inlayHint") then
				local excluded_servers = { "lua_ls" }
				if not vim.tbl_contains(excluded_servers, client.name) then
					vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
				end
			end

			if client:supports_method("textDocument/codeLens") then
				vim.api.nvim_set_hl(0, "LspCodeLens", { bg = "NONE" })
				vim.lsp.codelens.enable()
			end
		end

		vim.lsp.config("*", {
			capabilities = capabilities,
			on_attach = on_attach,
		})
	end,
}
