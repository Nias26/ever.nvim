return {
    "j-hui/fidget.nvim",
	enabled = false, -- Why disable such a great plugin??? Because `lua print(require"fidget".is_installed())` returns false. Only with null-ls works (idk why but fidget and mason are not friends)
    tag = "legacy",
    event = "LspAttach",
	config = function()
		require("fidget").setup{}
	end
}
