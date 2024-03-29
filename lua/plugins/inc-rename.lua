return {
	"smjonas/inc-rename.nvim",
	cmd = "IncRename",
	config = function()
		require("inc_rename").setup({
			preview_empty_name = false, -- whether an empty new name should be previewed; if false the command preview will be cancelled instead
			show_message = true, -- whether to display a `Renamed m instances in n files` message after a rename operation
			-- input_buffer_type = "dressing", -- the type of the external input buffer to use (the only supported value is currently "dressing")
			post_hook = nil, -- callback to run after renaming, receives the result table (from LSP handler) as an argument
		})
	end,
}
