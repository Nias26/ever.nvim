return {
	"lewis6991/gitsigns.nvim",
	event = "BufReadPost",
	opts = {
		on_attach = function(bufnr)
			local gitsigns = require("gitsigns")

			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			map("n", "]g", function()
				if vim.wo.diff then
					vim.cmd.normal({ "]g", bang = true })
				else
					gitsigns.nav_hunk("next")
				end
			end, { desc = "Next hunk" })

			map("n", "[g", function()
				if vim.wo.diff then
					vim.cmd.normal({ "[g", bang = true })
				else
					gitsigns.nav_hunk("prev")
				end
			end, { desc = "Previous Hunk" })

			-- Actions
			map("n", "<leader>cgs", gitsigns.stage_hunk, { desc = "Stage Hunk" })
			map("n", "<leader>cgr", gitsigns.reset_hunk, { desc = "Reset Hunk" })

			map("v", "<leader>cgs", function()
				gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, { desc = "Stage Inline Hunk" })

			map("v", "<leader>cgr", function()
				gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, { desc = "Reset Inline Hunk" })

			map("n", "<leader>cgS", gitsigns.stage_buffer, { desc = "Stage Buffer" })
			map("n", "<leader>cgR", gitsigns.reset_buffer, { desc = "Reset Buffer" })
			map("n", "<leader>cgp", gitsigns.preview_hunk, { desc = "Preview Hunk" })
			map("n", "<leader>cgi", gitsigns.preview_hunk_inline, { desc = "Preview Hunk Inline" })

			map("n", "<leader>cgb", function()
				gitsigns.blame_line({ full = true })
			end, { desc = "Blame Line" })

			map("n", "<leader>cgd", gitsigns.diffthis, { desc = "Diffthis" })

			map("n", "<leader>cgd", function()
				gitsigns.diffthis("~")
			end, { desc = "Diffthis (~)" })

			map("n", "<leader>cgQ", function()
				gitsigns.setqflist("all")
			end, { desc = "Set Quickfix (All)" })
			map("n", "<leader>cgq", gitsigns.setqflist, { desc = "Set Quickfix" })

			-- Text object
			map({ "o", "x" }, "ih", gitsigns.select_hunk, { desc = "Select Hunk" })
		end,
	},
}
