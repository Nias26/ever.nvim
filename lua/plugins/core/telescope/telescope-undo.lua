return {
    "debugloop/telescope-undo.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
        require("telescope").load_extension("undo")
    end
}
