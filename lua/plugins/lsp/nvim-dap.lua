return {
	"rcarriga/nvim-dap-ui",
	lazy = true,
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
	},
	config = function()
		local ok, dapui = pcall(require, "dapui")
		if not ok then
			return print("Nvim-Dap-Ui failed to load")
		end

		local ok, dap = pcall(require, "dap")
		if not ok then
			return print("Nvim-Dap failed to load")
		end

		dapui.setup()

		dap.adapters.gdb = {
			type = "executable",
			command = "gdb",
			args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
		}

		---@diagnostic disable-next-line: inject-field
		dap.configurations.cpp = {
			{
				name = "Launch",
				type = "gdb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopAtBeginningOfMainSubprogram = false,
			},
			{
				name = "Select and attach to process",
				type = "gdb",
				request = "attach",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				pid = function()
					local name = vim.fn.input("Executable name (filter): ")
					return require("dap.utils").pick_process({ filter = name })
				end,
				cwd = "${workspaceFolder}",
			},
		}

		vim.keymap.set("n", "<localleader>e", dapui.eval, { desc = "(DAP) Eval Expression" })
		vim.keymap.set("n", "<localleader>b", dap.toggle_breakpoint, { desc = "(DAP) Toggle Breakpoint" })
		vim.keymap.set("n", "<localleader>c", dap.continue, { desc = "(DAP) Continue" })
		vim.keymap.set("n", "<localleader>o", dap.step_over, { desc = "(DAP) Step Over" })
		vim.keymap.set("n", "<localleader>i", dap.step_into, { desc = "(DAP) Step Into" })
		vim.keymap.set("n", "<localleader>R", dap.repl.open, { desc = "(DAP) REPL" })
		vim.keymap.set("n", "<localleader>n", "<cmd>DapNew<CR>", { desc = "(DAP) New Session", silent = true })
		vim.keymap.set("n", "<localleader>O", "<cmd>DapStepOut<CR>", { desc = "(DAP) Step Out" })
		vim.keymap.set("n", "<localleader>r", "<cmd>DapRestartFrame<CR>", { desc = "(DAP) Restart Session" })
		vim.keymap.set("n", "<localleader>t", "<cmd>DapTerminate<CR>", { desc = "(DAP) Terminate Session" })

		local oxocarbon = {
			base00 = "#161616",
			base01 = "#262626",
			base02 = "#393939",
			base03 = "#525252",
			base04 = "#dde1e6",
			base05 = "#f2f4f8",
			base06 = "#ffffff",
			base07 = "#08bdba",
			base08 = "#3ddbd9",
			base09 = "#78a9ff",
			base0A = "#ee5396",
			base0B = "#33b1ff",
			base0C = "#ff7eb6",
			base0D = "#42be65",
			base0E = "#be95ff",
			base0F = "#82cfff",
		}

		local hl = vim.api.nvim_set_hl
		hl(0, "DapUIBreakpointsCurrentLine", { fg = oxocarbon.base0A })
		hl(0, "DapUIBreakpointsDisabledLine", { fg = oxocarbon.base02 })
		hl(0, "DapUIBreakpointsInfo", { fg = oxocarbon.base08 })
		hl(0, "DapUIBreakpointsLine", { fg = oxocarbon.base08 })
		hl(0, "DapUIBreakpointsPath", { fg = oxocarbon.base07 })
		hl(0, "DapUICurrentFrameName", { fg = oxocarbon.base0D })
		hl(0, "DapUIFrameName", { fg = oxocarbon.base0D })
		hl(0, "DapUILineNumber", { fg = oxocarbon.base0A })
		hl(0, "DapUIModifiedValue", { fg = oxocarbon.base09 })
		hl(0, "DapUIPlayPause", { fg = oxocarbon.base0D })
		hl(0, "DapUIPlayPauseNC", { fg = oxocarbon.base0D })
		hl(0, "DapUIRestart", { fg = oxocarbon.base0D })
		hl(0, "DapUIRestartNC", { fg = oxocarbon.base0D })
		hl(0, "DapUIScope", { fg = oxocarbon.base07 })
		hl(0, "DapUISource", { fg = oxocarbon.base07 })
		hl(0, "DapUIStepBack", { fg = oxocarbon.base08 })
		hl(0, "DapUIStepBackNC", { fg = oxocarbon.base08 })
		hl(0, "DapUIStepInto", { fg = oxocarbon.base08 })
		hl(0, "DapUIStepIntoNC", { fg = oxocarbon.base08 })
		hl(0, "DapUIStepOut", { fg = oxocarbon.base08 })
		hl(0, "DapUIStepOutNC", { fg = oxocarbon.base08 })
		hl(0, "DapUIStepOver", { fg = oxocarbon.base08 })
		hl(0, "DapUIStepOverNC", { fg = oxocarbon.base08 })
		hl(0, "DapUIStop", { fg = oxocarbon.base0A })
		hl(0, "DapUIStopNC", { fg = oxocarbon.base0A })
		hl(0, "DapUIStoppedThread", { fg = oxocarbon.base0A })
		hl(0, "DapUIThread", { fg = oxocarbon.base0D })
		hl(0, "DapUIType", { fg = oxocarbon.base0E })
		hl(0, "DapUIUnavailable", { fg = oxocarbon.base02 })
		hl(0, "DapUIUnavailableNC", { fg = oxocarbon.base02 })
		hl(0, "DapUIValue", { fg = oxocarbon.base04 })
		hl(0, "DapUIVariable", { fg = oxocarbon.base04 })

		vim.fn.sign_define("DapBreakpoint", { text = "B", texthl = oxocarbon.base0A })
		vim.fn.sign_define("DapStopped", { text = "", texthl = oxocarbon.base06 })
		vim.fn.sign_define("DapBreakpointRejected", { text = "R", texthl = oxocarbon.base03 })
	end,
}
