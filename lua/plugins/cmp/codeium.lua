return {
	"Exafunction/codeium.vim",
	enabled = false,
	event = "BufRead",
	config = function()
		-- Change '<C-g>' here to any keycode you like.
		vim.keymap.set("i", "<c-c>", function()
			return vim.fn["codeium#Accept"]()
		end, { expr = true, silent = true })
		vim.keymap.set("i", "<c-n>", function()
			return vim.fn["codeium#CycleCompletions"](1)
		end, { expr = true, silent = true })
		vim.keymap.set("i", "<c-x>", function()
			return vim.fn["codeium#Clear"]()
		end, { expr = true, silent = true })
	end,
}
