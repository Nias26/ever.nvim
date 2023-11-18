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
		               deleted = "",
		               untracked = "󱈸",
		               ignored = "",
						}
					}
				}
			},
			git = {
				enable = true,
				ignore = false,
			}
		})
   end
}
