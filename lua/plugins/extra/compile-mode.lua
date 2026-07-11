return {
	"ej-shafran/compile-mode.nvim",
	branch = "latest",
	cmd = { "Compile", "Recompile", "Cc" },
	keys = {
		{ mode = "n", "!", ":Cc " },
	},
	dependencies = {
		{ "nvim-lua/plenary.nvim", lazy = true },
	},
	config = function()
		vim.g.compile_mode = {
			input_word_completion = true,
		}

		vim.api.nvim_create_user_command("Cc", function(args)
			if #args.args < 1 then
				vim.cmd("Recompile")
			else
				vim.cmd("Compile " .. args.args)
			end
		end, { nargs = "*" })
	end,
}
