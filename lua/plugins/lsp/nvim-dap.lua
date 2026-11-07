return {
	{
		"mfussenegger/nvim-dap",
		cmd = {
			"DapContinue",
			"DapDisconnect",
			"DapNew",
			"DapTerminate",
			"DapRestartFrame",
			"DapStepInto",
			"DapStepOut",
			"DapStepOver",
			"DapPause",
			"DapEval",
			"DapToggleRepl",
			"DapClearBreakpoints",
			"DapToggleBreakpoint",
			"DapSetLogLevel",
			"DapShowLog",
		},
		keys = {
			{ mode = "n", "<F4>", function() require("dap").continue() end, desc = "[DAP] Continue" },
			{ mode = "n", "<F5>", function() require("dap").step_over() end, desc = "[DAP] Step over" },
			{ mode = "n", "<F6>", function() require("dap").step_into() end, desc = "[DAP] Setp into" },
			{ mode = "n", "<F7>", function() require("dap").step_out() end, desc = "[DAP] Setp out" },
			{ mode = "n", "<Leader>b", function() require("dap").toggle_breakpoint() end, desc = "[DAP] Toggle breakpoint" },
			{
				mode = "n",
				"<Leader>B",
				function()
					require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
				end,
				desc = "[DAP] Set logged breakpoint",
			},
			{ mode = "n", "<Leader>dr", function() require("dap").repl.open() end, desc = "[DAP] Open REPL" },
			{ mode = "n", "<Leader>dl", function() require("dap").run_last() end, desc = "[DAP] Run last" },
			{ mode = { "n", "v" }, "<Leader>dh", function() require("dap.ui.widgets").hover() end, desc = "[DAP] Hover" },
			{ mode = { "n", "v" }, "<Leader>dp", function() require("dap.ui.widgets").preview() end, desc = "[DAP] Preview" },
			{
				mode = "n",
				"<Leader>df",
				function()
					local widgets = require("dap.ui.widgets")
					widgets.centered_float(widgets.frames)
				end,
				desc = "[DAP] Frames",
			},
			{
				mode = "n",
				"<Leader>ds",
				function()
					local widgets = require("dap.ui.widgets")
					widgets.centered_float(widgets.scopes)
				end,
				desc = "[DAP] Scopes",
			},
		},
		config = function()
			local dap = require("dap")

			dap.adapters.gdb = {
				type = "executable",
				command = "gdb",
				args = {
					"--interpreter=dap",
					"-ex",
					"set print pretty on",
					"-ex",
					"gef config gef.disable_color True",
				},
			}

			dap.configurations.c = {
				{
					name = "Launch",
					type = "gdb",
					request = "launch",
					program = function()
						local file = vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
						print(file)
						return file
					end,
					args = {},
					cwd = "${workspaceFolder}",
					stopAtBeginningOfMainSubprogram = false,
				},
			}
			dap.configurations.cpp = dap.configurations.c
			dap.configurations.rust = dap.configurations.c
		end,
	},
}
