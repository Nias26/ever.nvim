if vim.opt.diff:get() then
	-- Bootstrap lazy.nvim
	local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
	if not (vim.uv or vim.loop).fs_stat(lazypath) then
		local lazyrepo = "https://github.com/folke/lazy.nvim.git"
		local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
		if vim.v.shell_error ~= 0 then
			vim.api.nvim_echo({
				{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
				{ out, "WarningMsg" },
				{ "\nPress any key to exit..." },
			}, true, {})
			vim.fn.getchar()
			os.exit(1)
		end
	end
	vim.opt.rtp:prepend(lazypath)

	vim.loader.enable()
	vim.g.mapleader = " "
	vim.g.maplocalleader = "\\"

	vim.opt.relativenumber = false
	vim.opt.number = true
	vim.opt.inccommand = "split"
	vim.opt.ignorecase = true
	vim.opt.infercase = true
	vim.opt.laststatus = 3
	vim.opt.scrolloff = 4
	vim.opt.updatetime = 250
	vim.opt.timeoutlen = 250
	vim.opt.showmode = false
	vim.opt.splitbelow = true
	vim.opt.splitright = true
	vim.opt.undofile = true
	vim.opt.cursorline = true
	vim.opt.termguicolors = true
	vim.opt.tabstop = 2
	vim.opt.softtabstop = 2
	vim.opt.shiftwidth = 2
	vim.opt.expandtab = true
	vim.opt.autochdir = true
	vim.opt.clipboard = "unnamedplus"
	vim.opt.wrap = false
	vim.opt.grepprg = "rg --vimgrep --smart-case"
	vim.opt.grepformat = "%f:%l:%c:%m"
	vim.opt.formatexpr = "v:lua.require'conform'.formatexpr()"
	vim.opt.mousemodel = "extend"
	vim.opt.fillchars = {
		eob = " ",
		vert = "│",
		horiz = "─",
		diff = "╱",
		foldopen = "",
		foldclose = "",
		fold = " ",
		msgsep = "─",
	}
	vim.optlistchars = {
		trail = "·",
	}
	vim.opt.conceallevel = 2
	vim.opt.signcolumn = "yes:1"
	vim.opt.writebackup = false
	vim.opt.swapfile = false
	vim.opt.smartcase = true
	vim.opt.gdefault = true
	vim.opt.path = { ".", "**" }
	vim.opt.splitkeep = "screen"

	require("lazy").setup({
		spec = {
			{
				"sindrets/diffview.nvim",
				keys = {
					{ mode = "n", "<leader>o", "<cmd>DiffviewOpen<CR>", desc = "Open Diffview" },
					{ mode = "n", "<leader>f", "<cmd>DiffviewToggleFiles<CR>", desc = "Open Diffview" },
					{ mode = "n", "<leader>c", "<cmd>DiffviewClose<CR>", desc = "Open Diffview" },
					{ mode = "n", "<leader>r", "<cmd>DiffviewRefreshCR>", desc = "Open Diffview" },
					{ mode = "n", "<leader>h", "<cmd>DiffviewFileHistory<CR>", desc = "Open Diffview" },
				},
			},
			{
				"nyoom-engineering/oxocarbon.nvim",
				priority = 1000,
				lazy = false,
			},
			{
				"stevearc/oil.nvim",
				lazy = false,
				dependencies = { "nvim-tree/nvim-web-devicons" },
				keys = {
					{ mode = "n", "<leader>oo", "<cmd>Oil<CR>", desc = "Open Oil buffer" },
				},
				opts = {
					default_file_explorer = true,
					columns = {
						"permissions",
						"size",
						"mtime",
						"icon",
					},
					skip_confirm_for_simple_edits = true,
					prompt_save_on_select_new_entry = true,
					watch_for_changes = true,
					view_options = {
						show_hidden = true,
						case_insensitive = true,
					},
				},
			},
		},
		disabled_plugins = {
			"gzip",
			"matchit",
			"matchparen",
			"netrwPlugin",
			"tarPlugin",
			"tohtml",
			"tutor",
			"zipPlugin",
		},
	})

	vim.opt.background = "dark"
	vim.cmd.colorscheme("oxocarbon")
end
