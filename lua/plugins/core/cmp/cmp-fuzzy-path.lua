return {
    "tzachar/cmp-fuzzy-path",
    dependencies = {
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = 'make'
        },
        "hrsh7th/nvim-cmp",
        "tzachar/fuzzy.nvim"
    }
}
