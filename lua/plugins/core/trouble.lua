return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    config = function()
        require("trouble").setup({
            -- position = "right",
            width = 50,
            icons = true,
            mode = "workspace_diagnostics",
            fold_open = "",
            fold_closed = "",
        })
    end
}
