return {
	"mg979/vim-visual-multi",
	event = "BufEnter",
	config = function()
		vim.g.VM_mouse_mappings = 0
		vim.g.VM_maps = {}
	end,
}
