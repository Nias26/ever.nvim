return {
	"nvimtools/hydra.nvim",
	keys = { "<C-w>", "<C-t>" },
	config = function()
		local Hydra = require("hydra")

		Hydra({
			name = " Window",
			mode = "n",
			hint = [[
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
^                                Window                                ^
^   -----------------------------------------------------------------   ^
^                        _+_: Increase Height                           ^
^           _<Up>_         _-_: Decrease Height                         ^
^                        _<_: Decrease Width       _q_:   Exit Hydra    ^
^     _<Left>_    _<Right>_  _>_: Increase Width     _<Esc>_: Exit Hydra^
^                        _=_: Balance Windows                           ^
^          _<Down>_        _|_: Fullscreen Window                       ^
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
]],
			config = {
				exit = false,
				foreign_keys = "warn",
				color = "amaranth",
				invoke_on_body = true,
				timeout = false,
				hint = {
					type = "window",
				},
				on_enter = function()
					vim.bo.modifiable = false
				end,
			},
			body = "<C-w>",
			heads = {
				{ "<Esc>", nil, { exit = true } },
				{ "q", nil, { exit = true } },
				{ "<Left>", "<C-w>h" },
				{ "<Down>", "<C-w>j" },
				{ "<Up>", "<C-w>k" },
				{ "<Right>", "<C-w>l" },
				{ "+", "<C-w>+" },
				{ "-", "<C-w>-" },
				{ "<", "<C-w><" },
				{ ">", "<C-w>>" },
				{ "=", "<C-w>=" },
				{ "|", "<C-w>|" },
			},
		})

		Hydra({
			name = "󰓩 Tabs",
			mode = "n",
			hint = [[
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
^                                󰓩 Tabs                                ^
^   ----------------------------------------------------------------   ^
^                                                                      ^
^        _[_            _]_      _t_: New tab              _q_:   Exit Hydra^
^   Prevoius Tab   Next Tab  _d_: Delete Current Tab _<Esc>_: Exit Hydra^
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
]],
			config = {
				exit = true,
				foreign_keys = "warn",
				color = "teal",
				invoke_on_body = true,
				timeout = false,
				hint = {
					type = "window",
				},
				on_enter = function()
					vim.bo.modifiable = false
				end,
			},
			body = "<C-t>",
			heads = {
				{ "<Esc>", nil },
				{ "q", nil },
				{ "t", "<cmd>tabnew<CR>" },
				{ "d", "<cmd>tabclose<CR>" },
				{ "[", "<cmd>tabprevious<CR>" },
				{ "]", "<cmd>tabnext<CR>" },
			},
		})
	end,
}
