return {
	"mhartington/formatter.nvim",
	event = "BufEnter",
	config = function()
		require("formatter").setup({
			-- Enable or disable logging
			logging = true,
			-- Set the log level
			log_level = vim.log.levels.WARN,
			-- All formatter configurations are opt-in
			filetype = {
				-- Formatter configurations for filetype "lua" go here
				-- and will be executed in order
				lua = {
					require("formatter.filetypes.lua").stylua,
					function()
						return {
							exe = "stylua",
						}
					end,
				},
				cpp = {
					require("formatter.filetypes.cpp").clangformat,
					function()
						return {
							exe = "clang-format",
						}
					end,
				},
			},
		})
		vim.api.nvim_create_augroup("Formatter", { clear = true })
		vim.api.nvim_create_autocmd("BufWritePost", {
			group = "Formatter",
			command = ":FormatWrite",
		})
	end,
}
