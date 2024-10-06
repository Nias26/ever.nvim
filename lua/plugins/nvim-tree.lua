return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("nvim-tree").setup({
			renderer = {
				icons = {
					glyphs = {
						default = "",
						symlink = "",
						git = {
							unstaged = "",
							staged = "",
							unmerged = "",
							renamed = "󰏪",
							deleted = "-",
							untracked = "󱈸",
							ignored = "",
						},
					},
				},
			},
			git = {
				enable = true,
				ignore = false,
			},
			-- sync_root_with_cwd = true,
			respect_buf_cwd = false,
			update_focused_file = {
				enable = true,
				-- update_root = true,
			},
		})

		vim.keymap.set("n", "<M-CR>", require("nvim-tree.api").tree.change_root_to_node)
	end,
}
