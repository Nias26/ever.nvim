-- TODO: Fix lsp on rust
return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "mason-org/mason.nvim", cmd = "Mason", opts = {} },
		{ "mason-org/mason-lspconfig.nvim", config = function() end },
		{ "mfussenegger/nvim-jdtls", lazy = true },
	},
	keys = {
		{ "gd", vim.lsp.buf.definition, desc = "Goto Definition" },
		{ "cs", vim.lsp.buf.signature_help, desc = "Signature Help" },
		{
			"cx",
			function()
				vim.lsp.buf.format({ async = true })
			end,
			desc = "Code Format",
		},
		{ "cr", vim.lsp.buf.rename, desc = "Rename Symbol" },
		{ "cl", vim.lsp.codelens.run, desc = "CodeLens Action" },
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

		local capabilities = {
			textDocument = {
				completion = {
					snippetSupport = true,
					insertReplaceEdit = true,
					labelDetailSupport = true,
				},
			},
		}

		vim.lsp.config("*", {
			capabilities = capabilities,
			on_attach = function(client, bufnr)
				if client:supports_method("textDocument/inlayHint") then
					local excluded = { "lua_ls" }
					if not vim.tbl_contains(excluded, client.name) then
						vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
					end
				end

				-- if client:supports_method("textDocument/codeLens") then
				-- 	local excluded = { "lua_ls" }
				-- 	if not vim.tbl_contains(excluded, client.name) then
				-- 		vim.api.nvim_set_hl(0, "LspCodeLens", { bg = "NONE" })
				-- 		vim.lsp.codelens.enable()
				-- 	end
				-- end
			end,
		})

		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})

		require("mason-lspconfig").setup({
			automatic_enable = true,
		})
	end,
}
