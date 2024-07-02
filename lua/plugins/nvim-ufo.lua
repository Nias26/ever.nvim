return {
	"kevinhwang91/nvim-ufo",
	event = "BufReadPost",
	keys = { "za" },
	dependencies = { "kevinhwang91/promise-async" },
	config = function()
		vim.o.foldcolumn = "1"
		-- vim.o.foldnestmax = 1
		vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
		vim.o.foldlevel = 99
		vim.o.foldlevelstart = 99
		vim.opt.foldenable = true
		vim.o.foldmethod = "expr"
		vim.o.foldexpr = "nvim_treesitter#foldexpr()"
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
		require("ufo").setup()
	end,
}
