return {
	"hedyhli/outline.nvim",
	cmd = { "Outline", "OutlineOpen" },
	config = function()
		require("outline").setup({
			outline_window = {
				position = "left",
				auto_jump = true,
			},
		})
	end,
}
