return {
	"neovim/nvim-lspconfig",
	event = "VeryLazy",
	lazy = false, -- Important!!
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
		vim.api.nvim_set_hl(0, "LspCodeLens", { bg = "NONE" })

		local capabilities = require("blink.cmp").get_lsp_capabilities()
		local on_attach = function(client, bufnr)
			if client:supports_method("textDocument/inlayHint") then
				if client.name ~= "lua_ls" then
					vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
				end
			end

			if client:supports_method("textDocuments/codeLens") then
				vim.lsp.codelens.refresh()
				vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
					buffer = bufnr,
					callback = vim.lsp.codelens.refresh,
				})
			end
		end

		vim.lsp.config("*", {
			capabilities = capabilities,
			on_attach = on_attach,
		})
	end,
}
