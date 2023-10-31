-- Comment if you want to use wich-key (Already configured)
require("keybinds.which-key")

-- Uncomment if you want to use wf (Not configured)
--require("keybinds.wf")

-- Other keybinds
map('n', '<ESC><ESC>', '<cmd>noh<CR>')
map({'n', 'v'}, '!', '<C-w>w')
map({'n', 'v'}, 'o', '<cmd>URLOpenUnderCursor<CR>')
map({'n', 'c'}, '%', '<cmd>source %<CR>')
map('n', ',', 'N')
map('n', '.', 'n')
