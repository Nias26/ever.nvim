return {
	"luukvbaal/statuscol.nvim",
	event = "VeryLazy",
	config = function()
		local builtin = require("statuscol.builtin")
		require("statuscol").setup({
			segments = {
				{ text = { "%s" }, click = "v:lua.ScSa" },
				{ text = { builtin.lnumfunc }, click = "v:lua.ScLa" },
				{
					text = { " ", builtin.foldfunc, " " },
					condition = { builtin.not_empty, true, builtin.not_empty },
					click = "v:lua.ScFa",
				},
			},
			ft_ignore = { "NvimTree", "dashboard" },
			bt_ignore = { "NvimTree", "dashboard" },
		})
	end,
}
