return {
	"rcarriga/nvim-notify",
	event = "VeryLazy",
	config = function()
		---@diagnostic disable-next-line: missing-fields
		require("notify").setup({
			background_colour = "#000000",
			render = function(bufnr, notif, highlights, config)
				local notify_renderers = require("notify.render")
				local minimal_titles = { "", "Messages", "Notify" }
				if vim.list_contains(minimal_titles, notif.title[1]) then
					highlights.body = "Notify" .. notif.level .. "Title"
					notif.message[1] = " " .. notif.icon .. "\t" .. notif.message[1]

					return notify_renderers.minimal(bufnr, notif, highlights, config)
				end

				return notify_renderers.compact(bufnr, notif, highlights, config)
			end,
			stages = "static",
			top_down = false,
			on_open = function(win)
				vim.api.nvim_win_set_config(win, { border = "none", focusable = false })
			end,
		})
	end,
}
