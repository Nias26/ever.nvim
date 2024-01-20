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
						-- NOTE:Supports conditional formatting (which doesn't work for me )
						--[[ if require("formatter.util").get_current_buffer_file_name() == "init.lua" then
							return nil
						end ]]
						return {
							exe = "stylua",
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
