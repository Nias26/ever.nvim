return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 500
    end,
    opts = {
        plugins = {
            presets = {
                operators = false,
            },
        },
		icons = {
			group = " ",
		},
		layout = {
			align = "center",
			spacing = 5,
			height = { min = 5, max = 25 },
			width = { min = 20, max = 50 },
		}
    }
}
