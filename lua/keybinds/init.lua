-- Comment if you want to use wich-key (Already configured)
require("keybinds.which-key")

-- Uncomment if you want to use wf (Not configured)
--require("keybinds.wf")

-- Other keybinds
local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.keymap.set(mode, lhs, rhs, options)
end

map('n', '<ESC><ESC>', '<cmd>noh<CR>')
map({'n', 'v'}, '!', '<C-w>w')
map({'n', 'v'}, 'o', '<cmd>URLOpenUnderCursor<CR>')
map({'n', 'c'}, '%', '<cmd>source %<CR>')
