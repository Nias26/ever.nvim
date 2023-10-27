return {
    "nvim-telescope/telescope-project.nvim",
	lazy = true,
    config = function()
        require("telescope").load_extension("project")
    end
}
