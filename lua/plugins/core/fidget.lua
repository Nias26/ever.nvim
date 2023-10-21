return {
    "j-hui/fidget.nvim",
    tag = "legacy",
    event = "LspAttach",
    opts = {},
    config = function()
        require("fidget").setup{}
    end
}
