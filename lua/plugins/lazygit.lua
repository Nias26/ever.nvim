return {
	"kdheepak/lazygit.nvim",
	cmd = { "LazyGit", "LazyGitConfig", "LazyGitFilter", "LazyGitCurrentFile", "LazyGitFilterCurrentFile" },
	event = "BufEnter",
	dependencies = { "nvim-lua/plenary.nvim",	}
}
