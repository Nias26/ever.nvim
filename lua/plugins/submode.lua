return {
	"pogyomo/submode.nvim",
	-- keys = { "<C-w>", "<C-t>" },
	config = function()
		local submode = require("submode")

		submode.create("Window", {
			show_mode = true,
			mode = "n",
			enter = "<C-w>",
			leave = { "q", "<ESC>" },
			default = function(register)
				register("<Left>", "<C-w>h")
				register("<Down>", "<C-w>j")
				register("<Up>", "<C-w>k")
				register("<Right>", "<C-w>l")
				register("!", "<C-w>w")
				register("+", "<C-w>+")
				register("-", "<C-w>-")
				register("<", "<C-w><")
				register(">", "<C-w>>")
				register("=", "<C-w>=")
				register("|", "<C-w>|")
			end,
		})

		vim.api.nvim_create_augroup("SubmodeNotify", { clear = true })
		vim.api.nvim_create_autocmd("User", {
			group = "SubmodeNotify",
			pattern = "SubmodeEnterPost",
			callback = function()
				if submode.mode() == "Window" then
					vim.notify(" Window Mode", vim.log.levels.WARN, { timeout = false })
				end
			end,
		})

		vim.api.nvim_create_autocmd("User", {
			group = "SubmodeNotify",
			pattern = "SubmodeLeavePost",
			callback = function()
				---@diagnostic disable-next-line: missing-parameter
				require("notify").dismiss()
			end,
		})
	end,
}
