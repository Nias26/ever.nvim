return {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	event = "LspAttach",
	enabled = false,
	config = function()
        require("lsp_lines").setup()
        vim.diagnostic.config({
            virtual_text = false,
        })
        -- https://github.com/folke/lazy.nvim/issues/620
        vim.diagnostic.config({ virtual_lines = false }, require("lazy.core.config").ns)
    end
}
