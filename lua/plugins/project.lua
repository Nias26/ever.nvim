return {
	"ahmedkhalf/project.nvim",
	lazy = true,
   config = function()
   	require("project_nvim").setup{}
      require('telescope').load_extension('projects')
   end
}
