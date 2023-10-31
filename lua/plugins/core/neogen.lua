return {
	"danymat/neogen",
	event = "VeryLazy",
   dependencies = { "nvim-treesitter/nvim-treesitter" },
   config = function()
   	require('neogen').setup({ snippet_engine = "luasnip" })
   end
}
