return {
	"altermo/ultimate-autopair.nvim",
	event = { "InsertEnter", "CmdlineEnter" },
	branch = "v0.6",
	opts = {
		bs = {
			enable = true,
			space = "balance",
			indent_ignore = true,
		},
		cr = {
			enable = true,
			autoclose = true,
		},
		space = {
			enable = true,
		},
		space2 = {
			enable = false,
		},
		fastwarp = {
			enable = true,
			map = "<A-h>",
			rmap = "<A-l>",
			cmap = "<A-h>",
			rcmap = "<A-l>",
		},
		close = {
			enable = false,
		},
		tabout = {
			enable = false,
		},
	},
}
