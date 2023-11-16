-- Vim keymaps
local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.keymap.set(mode, lhs, rhs, options)
end

-- vim.cmd
local function fcmd(command, opts)
	vim.cmd({ cmd = command, args = {opts}})
end

local function OpenDiagnosticIfNoFloat()
	for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
   	if vim.api.nvim_win_get_config(winid).zindex then
      	return
      end
   end
   -- THIS IS FOR BUILTIN LSP
   vim.diagnostic.open_float(0, {
   	scope = "cursor",
      focusable = false,
      close_events = {
      	"CursorMoved",
      	"CursorMovedI",
      	"BufHidden",
      	"InsertCharPre",
      	"WinLeave",
      },
   })
end

return {
	map = map,
	fcmd = fcmd,
	OpenDiagnosticIfNoFloat = OpenDiagnosticIfNoFloat
}
