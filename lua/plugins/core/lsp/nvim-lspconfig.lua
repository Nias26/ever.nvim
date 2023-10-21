return {
    "neovim/nvim-lspconfig",
    config = function()
        vim.diagnostic.config({
            virtual_text = false, --{
                --prefix = "■",
                -- language server's name 
                --source = "always",
                -- severity\_limit = "Warning"
            --},
            signs = true,
            underline = true,
            update_in_insert = false,
            severity_sort = false
        })
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
					}
				}
			}
		})
    end
}
