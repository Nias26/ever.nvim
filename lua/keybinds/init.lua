-- Which-key Keybinds
local status_ok, _ = pcall(require, "keybinds.which-key")
if not status_ok then
   return
end

-- keybinds
local map = vim.keymap.set

-- Movment
map({'n', 'v'}, 'H', '<S-Left>', {desc = "Move 1 word to the left"})
map({'n', 'v'}, 'L', '<S-Right>', {desc = "Move 1 word to the right"})
-- Delte without copying
-- map({'n', 'v', 'x'}, 'dd', '"_dd')
-- Cancecl highlightning when searching
map('n', '<ESC><ESC>', '<cmd>nohlsearch<CR>')
-- Fast switch window
map({'n', 'v'}, '!', '<C-w>w')
-- Open URL under cursor
map('n', '<C-o>', '<cmd>URLOpenUnderCursor<CR>')
-- Previous search
map('n', ',', 'N')
-- Next search
map('n', '.', 'n')
-- Fast window switch
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')
-- Open Telescope
map({'n', 'v'}, '<C-T>', '<cmd>Telescope<CR>', {desc = "Open Telescope"})
-- Open Nvim Tree
map('n', '<C-e>', '<cmd>NvimTreeToggle<CR>', {desc = "Open Nvim Tree"})
-- Buffer managing
map('n', 'bd', '<cmd>bdel<CR>', {desc = "Delete current buffer"})
map('n', '[', '<cmd>bprevious<CR>', {desc = "Previous buffer"})
map('n', ']', '<cmd>bnext<CR>', {desc = "Next buffer"})
map('n', '<Tab>', '<cmd>bnext<CR>')
-- Tab managing
map('n', 'T', '<cmd>tabnew<CR>', {desc = "New tab"})
map('n', 'Td', '<cmd>tabclose<CR>', {desc="Close current tab"})
map('n', '<S-Tab>', '<cmd>tabnext<CR>', {desc = "Next tab"})
-- Splits
map('n', 'Sh', function() vim.ui.input({prompt = 'Horizzontal split'}, function(input)	if input == "" then return	end fcmd('split', input)	end) end, {desc = "Horizzontal Split"})
map('n', 'Sv', function() vim.ui.input({prompt = 'Vertical split'}, function(input) if input == "" then return end fcmd('vsplit', input) end) end, {desc = "Vertical Split"})
map('n', '<A-h>', '<C-w>>')
map('n', '<A-j>', '<C-w>-')
map('n', '<A-k>', '<C-w>+')
map('n', '<A-l>', '<C-w><')
map({'n', 'v'}, 'Q', '<cmd>q<CR>', {desc = "Quit current window"})
-- LSP
map({'n', 'v'}, 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {desc = "Go to definition"})
map({'n', 'v'}, 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', {desc = "Go to references"})
map('n', 'ca', '<cmd>Lspsaga code_action<CR>', {desc = "Code Actions"})
map('n', 'cd', '<cmd>Lspsaga hover_doc<CR>', {desc = "LSP Signature"})
map('n', 'cf', '<cmd>Lspsaga finder<CR>', {desc = "Find References"})
-- Text modification
map('v', '<C-Down>', '<cmd>m .+1<CR>', {desc = "Move line down"})
map('v', '<C-Up>', '<cmd>m .-2<CR>', {desc = "Move line up"})
map('v', 'P', '"_dP', {desc = "Delete and paste"})
-- Open telescope-undo
map('n', 'U', '<cmd>Telescope undo<CR>', {desc="Open undo history"})
