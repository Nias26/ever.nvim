return {
	"numToStr/Comment.nvim",
	event = "BufEnter",
	keys = {
		{ "cc", mode = { "n", "v" } },
		{ "Cc", mode = { "n", "v" } },
	},
	opts = {
		toggler = {
			line = "cc",
		},
		opleader = {
			line = "cc",
			block = "Cc",
		},
	},
}
