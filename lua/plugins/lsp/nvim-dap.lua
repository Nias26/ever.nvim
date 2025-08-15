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
			{
				name = "Attach to gdbserver :1234",
				type = "gdb",
				request = "attach",
				target = "localhost:1234",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
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
	end,
}
