return {
	"mg979/vim-visual-multi",
	event = "BufEnter",
	init = function()
		vim.g.VM_set_statusline = 0
		vim.g.VM_mouse_mappings = 0
		vim.g.VM_maps = {
			-- Experimental
			["Undo"] = "u",
			["Redo"] = "<C-r>",
			["Exit"] = "<Esc>",
		}
	end,
}
