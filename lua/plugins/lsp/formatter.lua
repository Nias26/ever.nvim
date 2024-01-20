return {
	"mhartington/formatter.nvim",
	event = "BufEnter *.lua",
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
						-- Supports conditional formatting
						if vim.fn.expand("%:p") == "init.lua" then
							return nil
						end
						return {
							exe = "stylua",
							stdin = true,
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
