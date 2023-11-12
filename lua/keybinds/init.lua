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
map('n', '<ESC><ESC>', '<cmd>noh<CR>')
map({'n', 'v'}, '!', '<C-w>w')
map({'n', 'v'}, 'o', '<cmd>URLOpenUnderCursor<CR>')
map({'n', 'c'}, '%', '<cmd>source %<CR>')
map('n', ',', 'N')
map('n', '.', 'n')
