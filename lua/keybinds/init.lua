-- LeaderTutor
-- Command
-- vim.api.nvim_create_user_command()

-- Default value
--WARN: DO NOT CHANGE THIS VALUE!!!
Leadertutor = 1
if Leadertutor == 0 then
	require("keybinds.which-key-NL")
elseif Leadertutor == 1 then
	require("keybinds.which-key")
elseif Leadertutor == 2 then
	require("keybinds.which-key-NK")
end

-- Comment if you want to use wich-key (Already configured)
-- require("keybinds.which-key")

-- Other keybinds
local map = vim.keymap.set

map('n', '<ESC><ESC>', '<cmd>noh<CR>')
map({'n', 'v'}, '!', '<C-w>w')
map('n', 'o', '<cmd>URLOpenUnderCursor<CR>')
map('n', '%', '<cmd>source %<CR>')
map('n', ',', 'N')
map('n', '.', 'n')
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')
map('n', '<S-h>', '<S-Left>')
map('n', '<S-l>', '<S-Right>')
map('n', '<S-j>', '<PageDown>')
map('n', '<S-k>', '<PageUp>')
map('n', '<C-Left>', '<C-w>h')
map('n', '<C-Down>', '<C-w>j')
map('n', '<C-Up>', '<C-w>k')
map('n', '<C-Right>', '<C-w>l')
