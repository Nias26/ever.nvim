return {
	"mg979/vim-visual-multi",
	event = { "BufNewFile", "BufReadPost" },
	config = function()
		vim.g.VM_set_statusline = 0
		vim.g.VM_mouse_mappings = 0
		vim.g.VM_maps = {
			["Undo"] = "u",
			["Redo"] = "<C-r>",
			["Exit"] = "<Esc>",
		}
	end,
}
