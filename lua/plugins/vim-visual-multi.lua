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

			-- Line Cursor
			["Add Cursor Down"] = "<Down>",
			["Add Cursor Up"] = "<Up>",

			-- Match Cursor
			["Find Under"] = "<C-n>",
			["Find Subword Under"] = "<C-n>",

			["Exit"] = "<Esc>",
		}
	end,
}
