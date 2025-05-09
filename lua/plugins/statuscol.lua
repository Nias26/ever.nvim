return {
	"luukvbaal/statuscol.nvim",
	event = "VeryLazy",
	config = function()
		local builtin = require("statuscol.builtin")
		require("statuscol").setup({
			thousands = false,
			relculright = false,
			segments = {
				{ text = { "%s" }, click = "v:lua.ScSa" },
				{
					text = { builtin.lnumfunc, " " },
					condition = { true, builtin.not_empty },
					click = "v:lua.ScLa",
				},
				{
					text = { " ", builtin.foldfunc, " " },
					condition = { builtin.not_empty, true, builtin.not_empty },
					click = "v:lua.ScFa",
				},
			},
			clickmod = "c",
			clickhandlers = {
				Lnum = builtin.lnum_click,
				FoldClose = builtin.foldclose_click,
				FoldOpen = builtin.foldopen_click,
				FoldOther = builtin.foldother_click,
				DapBreakpointRejected = builtin.toggle_breakpoint,
				DapBreakpoint = builtin.toggle_breakpoint,
				DapBreakpointCondition = builtin.toggle_breakpoint,
				["diagnostic/signs"] = builtin.diagnostic_click,
				gitsigns = builtin.gitsigns_click,
			},
			ft_ignore = { "neo-tree" },
			bt_ignore = { "neo-tree" },
		})
	end,
}
