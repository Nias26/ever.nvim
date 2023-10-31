return {
	"mrjones2014/legendary.nvim",
   priority = 10000,
   lazy = false,
   dependencies = { "stevearc/dressing.nvim" },
   config = function()
   	require("legendary").setup({
      	select_prompt = '   legendary.nvim  󰓥',
      })
   end
}
