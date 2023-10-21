return {
    "jay-babu/mason-null-ls.nvim",
    enabled = false,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "williamboman/mason.nvim",
        "nvimtools/none-ls.nvim"
    },
    config = function()
        require("mason").setup()
        local null_ls = require'null-ls'
        require("mason-null-ls").setup({
            ensure_installed = {
                -- Opt to list sources here, when available in mason.
            },
            automatic_installation = false,
            handlers = {},
        })
        null_ls.setup({
            sources = {
                -- Anything not supported by mason.
            }
        })
    end
}
