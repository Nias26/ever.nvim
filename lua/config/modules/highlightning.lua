local M = {}

M.setup = function()
	vim.api.nvim_set_hl(0, "DashboardFooter", { fg = "#08A045" })
	vim.api.nvim_set_hl(0, "Comment", { fg = "#525252", italic = false })
end

return M
