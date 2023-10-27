return {
    "petertriho/cmp-git",
	lazy = true,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp"
    },
    config = function()
        require("cmp_git").setup()
    end
}
