return {
	"mg979/vim-visual-multi",
	event = { "BufNewFile", "BufReadPost" },
  keys = { "<C-n>", "<C-\\>", "\\" },
	init = function()
		vim.g.VM_leader = "\\"
		vim.g.VM_set_statusline = 0
		vim.g.VM_mouse_mappings = 0
    vim.g.VM_show_warnings  = 0
		vim.g.VM_maps = {
			["Undo"] = "u",
			["Redo"] = "<C-r>",
			["Exit"] = "<Esc>",
		}
	end,
}
