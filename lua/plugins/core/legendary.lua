return {
	"mrjones2014/legendary.nvim",
	enabled = false, -- Not useful but still cool
   priority = 10000,
   lazy = false,
   dependencies = { "stevearc/dressing.nvim" },
   config = function()
   	require("legendary").setup({
      	select_prompt = '   legendary.nvim  󰓥',
      })
   end
}
