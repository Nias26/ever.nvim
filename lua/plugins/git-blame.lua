return {
	"f-person/git-blame.nvim",
	cmd = {
		"GitBlameEnable",
		"GitBlameToggle",
		"GitBlameCopySHA",
		"GitBlameDisable",
		"GitBlameCopyFileURL",
		"GitBlameOpenFileURL",
		"GitBlameCopyCommitURL",
		"GitBlameOpenCommitURL",
	},
	config = function()
		require("gitblame").setup({
			enabled = false,
		})
	end,
}
