return {
    "petertriho/cmp-git",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp"
    },
    config = function()
        require("cmp_git").setup()
    end
}
