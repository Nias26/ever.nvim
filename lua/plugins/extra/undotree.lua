return {
	"mbbill/undotree",
	cmd = { "UndotreeToggle", "UndotreeHide", "UndotreeShow", "UndotreeFocus", "UndotreePersistUndo" },
	config = function()
		vim.g.undotree_SetFocusWhenToggle = 1
		vim.g.undotree_DiffAutoOpen = 0
	end,
}
