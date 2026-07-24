return {
	"stevearc/oil.nvim",
	lazy = false,
	dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
	keys = {
		{ "<leader>0", "<cmd>Oil<CR>", desc = "Oil" },
	},
	config = function()
		function _G.get_oil_winbar()
			local bufnr = vim.api.nvim_win_get_buf(vim.g.statusline_winid)
			local dir = require("oil").get_current_dir(bufnr)
			if dir then
				return vim.fn.fnamemodify(dir, ":~")
			else
				-- If there is no current directory (e.g. over ssh), just show the buffer name
				return vim.api.nvim_buf_get_name(0)
			end
		end

		require("oil").setup({
			default_file_explorer = true,
			columns = { "permissions", "size", "mtime", "icon" },
			skip_confirm_for_simple_edits = true,
			prompt_save_on_select_new_entry = false,
			cleanup_delay_ms = false,
			constrain_cursor = "editable",
			watch_for_changes = true,
			view_options = {
				show_hidden = true,
				case_insensitive = true,
			},
			win_options = {
				winbar = "%!v:lua.get_oil_winbar()",
			},
			keymaps = {
				["~"] = { "<cmd>edit ~/<CR>", desc = "Go to ~" },
				["`"] = { "actions.tcd", desc = "Cd to cwd" },
				["gy"] = {
					function()
						local oil = require("oil")
						vim.fn.setreg("+", oil.get_current_dir(0))
						print("Copied the cwd to the clipboard")
					end,
					desc = "Copy cwd to system clipboard",
				},
				["."] = {
					function()
						local oil = require("oil")
						local entry = oil.get_cursor_entry()
						if not entry then
							return
						end

						local dir = oil.get_current_dir()
						local path = vim.fs.joinpath(dir, entry.name)
						path = vim.fn.fnamemodify(path, ":.")
						path = vim.fn.fnameescape(path)
						local keys = vim.keycode(": " .. path .. "<Home>")
						vim.api.nvim_feedkeys(keys, "n", false)
					end,
					desc = "Execute command on file",
				},
				["!"] = {
					function()
						local oil = require("oil")
						local entry = oil.get_cursor_entry()
						if not entry then
							return
						end

						local dir = oil.get_current_dir()
						local path = vim.fs.joinpath(dir, entry.name)
						path = vim.fn.fnamemodify(path, ":.")
						path = vim.fn.fnameescape(path)
						local keys = vim.keycode(":! " .. path .. "<Home><Right>")
						vim.api.nvim_feedkeys(keys, "n", false)
					end,
					desc = "Execute shell command on file",
				},
			},
		})
	end,
}
