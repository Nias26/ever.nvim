return {
	"stevearc/oil.nvim",
	lazy = false,
	dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
	keys = {
		{ "<leader>0", "<cmd>Oil<CR>", desc = "Oil" },
	},
	opts = {
		-- columns shown in normal :Oil mode (all the usual info)
		columns = { "icon", "permissions", "size", "mtime" },

		-- sensible defaults that apply to both modes
		default_file_explorer = true,
		buf_options = {
			buflisted = false,
			bufhidden = "hide",
		},
		win_options = {
			wrap = false,
			signcolumn = "no",
			cursorcolumn = false,
			foldcolumn = "0",
			spell = false,
			list = false,
			conceallevel = 3,
			concealcursor = "nvic",
		},
		view_options = {
			show_hidden = true,
		},
		float = {
			padding = 2,
			max_width = 0,
			max_height = 0,
			border = "rounded",
			win_options = { winblend = 0 },
		},
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
			columns = {
				"permissions",
				"size",
				"mtime",
				"icon",
			},
			skip_confirm_for_simple_edits = true,
			constrain_cursor = "editable",
			watch_for_changes = true,
			view_options = {
				show_hidden = true,
				case_insensitive = true,
			},
			win_options = {
				winbar = "%!v:lua.get_oil_winbar()",
			},
		})
	end,
}
