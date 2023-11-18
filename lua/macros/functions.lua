-- vim.cmd
local function fcmd(command, opts)
	vim.cmd({ cmd = command, args = {opts}})
end

-- Open LSP Diagnostic window over error, warn, info, ...
-- Function to check if a floating dialog exists and if not then check for diagnostics under the cursor
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
	fcmd = fcmd,
	OpenDiagnosticIfNoFloat = OpenDiagnosticIfNoFloat
}
