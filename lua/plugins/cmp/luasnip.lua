return {
	"L3MON4D3/LuaSnip",
	event = "BufRead",
	dependencies = { "rafamadriz/friendly-snippets" },
	build = "make install_jsregexp",
	config = function()
		require("luasnip.loaders.from_vscode").lazy_load()
	end
}
