return {
	"mfussenegger/nvim-lint",
	event = "BufEnter",
	config = function()
		require("lint").linters_by_ft = {
			lua = { "luacheck" },
			cpp = { "cpplint" },
		}
		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}
