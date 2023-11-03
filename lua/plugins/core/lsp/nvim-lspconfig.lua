return {
	"neovim/nvim-lspconfig",
   config = function()
		local signs = { Error = " ", Warn = " ", Hint = "󰌵 ", Info = "󱈸 " }
      for type, icon in pairs(signs) do
      	local hl = "DiagnosticSign" .. type
         vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

		-- Fix for some lua_ls errors
		require("lspconfig").lua_ls.setup({
			settings = {
				Lua = {
					workspace = {
						checkThirdParty = false,
					},
				}
			}
		})
   end
}
