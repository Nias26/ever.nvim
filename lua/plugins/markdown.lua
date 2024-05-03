return {
	{
		"tadmccorkle/markdown.nvim",
		ft = "markdown",
		opts = {},
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = "markdown",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	{
		"Myzel394/easytables.nvim",
		ft = "markdown",
		opts = {},
	},
	{
		"MeanderingProgrammer/markdown.nvim",
		cmd = "RenderMarkdownToggle",
		ft = "markdown",
		name = "render-markdown",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		opts = { headings = { "󰎤 ", "󰼐 ", "󰎫 ", "󰲦 ", "󰲩 ", "󰬿" } },
	},
}
