return {
    "gregorias/nvim-mapper",
	enabled = false,
    dependencies = {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/popup.nvim",
            "nvim-lua/plenary.nvim"
        },
        config = function()
            require("telescope").load_extension("mapper")
        end
    },
    config = function()
        require("nvim-mapper").setup({
			no_map = true,
			action_on_enter = "definition",
		})
    end,
}
