return {
	"LintaoAmons/cd-project.nvim",
	config = function()
		require("cd-project").setup({
			-- this json file is acting like a database to update and read the projects in real time.
			-- So because it's just a json file, you can edit directly to add more paths you want manually
			projects_config_filepath = vim.fs.normalize(vim.fn.stdpath("config") .. "/cd-project.nvim.json"),
			-- this controls the behaviour of `CdProjectAdd` command about how to get the project directory
			project_dir_pattern = { ".git" },
			choice_format = "both", -- optional, you can switch to "name" or "path"
			projects_picker = "telescope", -- optional, you can switch to `telescope`
			-- do whatever you like by hooks
			hooks = {
				{
					callback = function(dir)
						vim.notify("switched to dir: " .. dir)
						vim.cmd("NvimTreeOpen")
					end,
				},
			},
		})
	end,
}
