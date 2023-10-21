return {
    "mvllow/modes.nvim",
    config = function()
        require("modes").setup({
            colors = {
                insert = "#be95ff",
                delete = "#ff7eb6",
                visual = "#82cfff",
                copy = "#42be65",
            }
        })
    end
}
