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
f.map('n', '<ESC><ESC>', '<cmd>noh<CR>')
f.map({'n', 'v'}, '!', '<C-w>w')
f.map({'n', 'v'}, 'o', '<cmd>URLOpenUnderCursor<CR>')
f.map('n', '%', '<cmd>source %<CR>')
f.map('n', ',', 'N')
f.map('n', '.', 'n')
