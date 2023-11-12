return {
	"danymat/neogen",
	event = "BufRead",
   dependencies = { "nvim-treesitter/nvim-treesitter" },
   config = function()
   	require('neogen').setup({ snippet_engine = "luasnip" })
   end
}
