return {
	"mg979/vim-visual-multi",
	event = { "BufNewFile", "BufReadPost" },
	init = function()
		vim.g.VM_leader = "\\"
		vim.g.VM_set_statusline = 0
		vim.g.VM_mouse_mappings = 0
		vim.g.VM_maps = {
			["Undo"] = "u",
			["Redo"] = "<C-r>",
			["Exit"] = "<Esc>",
		}
		vim.keymap.set("n", "<C-\\>", "<Plug>(VM-Add-Cursor-At-Pos)")
	end,
}
