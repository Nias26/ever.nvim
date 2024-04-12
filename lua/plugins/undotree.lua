return {
	"mbbill/undotree",
	keys = "U",
	config = function()
		vim.g.undotree_SetFocusWhenToggle = 1
		vim.g.undotree_DiffAutoOpen = 0
		vim.keymap.set("n", "U", "<cmd>UndotreeToggle<CR>", { desc = "Open undo history" })
	end,
}
