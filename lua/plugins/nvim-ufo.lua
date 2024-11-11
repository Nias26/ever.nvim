return {
	"kevinhwang91/nvim-ufo",
	event = "BufReadPost",
	keys = { "za" },
	dependencies = { "kevinhwang91/promise-async" },
	config = function()
		vim.opt.foldcolumn = "1"
		-- vim.o.foldnestmax = 1
		vim.opt.fillchars:append([[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]])
		vim.opt.foldlevel = 99
		vim.opt.foldlevelstart = 99
		vim.opt.foldenable = true
		vim.opt.foldmethod = "expr"
		vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
		vim.g.markdown_folding = 1

		-- Tell the server the capability of foldingRange,
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.textDocument.foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		}

		local language_servers = require("lspconfig").util.available_servers()
		for _, ls in ipairs(language_servers) do
			require("lspconfig")[ls].setup({
				capabilities = capabilities,
			})
		end

		-- Fold Highlightning group
		vim.api.nvim_set_hl(0, "FoldColumn", { fg = "#525252" })

		require("ufo").setup()
	end,
}
