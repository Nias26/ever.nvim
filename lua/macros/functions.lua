-- Vim keymaps
function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.keymap.set(mode, lhs, rhs, options)
end

-- vim.ui
function ui_input(opts, on_confirm)
	vim.ui.input(opts, on_confirm)
end

function ui_open(path)
	vim.ui.open(path)
end

function ui_select(items, opts, on_confirm)
	vim.ui.select(items, opts, on_confirm)
end

-- vim.cmd
function cmd(command, opts)
	vim.cmd({ cmd = command, args = {opts}})
end

