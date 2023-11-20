return {
	"stevearc/dressing.nvim",
	event = "VeryLazy",
	config = function()
		require("dressing").setup({
			input = {
				prefer_width = 65,
				width = 65,
				max_width = 90,
				min_width = 20,
			},
			select = {
				fzf = {
					window = {
						width = 65,
					},
				},
				fzf_lua = {
					winopts = {
						width = 65,
					},
				},
			},
			width = 65,
			height = 40,
		})
	end
}
