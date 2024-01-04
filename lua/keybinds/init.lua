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
map('n', '<ESC><ESC>', '<cmd>noh<CR>')
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
-- Open Dropbar
map('n', '<S-D>', '<cmd>lua require("dropbar.api").pick()<CR>', {desc = "Dropbar"})
-- Fold toggle
-- map('n', 'ff', 'za') -- (Current fold)
-- map('n', 'ft', 'zi') -- (Toggle fold)
-- Open Telescope
map({'n', 'v'}, 'T', '<cmd>Telescope<CR>', {desc = "Open Telescope"})
-- Buffer managing
map('n', '<C-b>n', function() vim.ui.input({prompt = 'New buffer'}, function(input) f.fcmd('badd', input)end)end, {desc = "New buffer"})
map('n', '<C-b>d', '<cmd>bdel<CR>', {desc = "Delete current buffer"})
map('n', '[', '<cmd>bprevious<CR>', {desc = "Previous buffer"})
map('n', ']', '<cmd>bnext<CR>', {desc = "Next buffer"})
map('n', '<Tab>', '<cmd>bnext<CR>')
map('n', '<S-Tab>', '<cmd>bprevious<CR>')
-- Splits
map('n', 'Sh', function() vim.ui.input({prompt = 'Horizzontal split'}, function(input)	if input == "" then return	end f.fcmd('split', input)	end) end, {desc = "Horizzontal Split"})
map('n', 'Sv', function() vim.ui.input({prompt = 'Vertical split'}, function(input) if input == "" then return end f.fcmd('vsplit', input) end) end, {desc = "Vertical Split"})
map('n', '<A-h>', '<C-w>>')
map('n', '<A-j>', '<C-w>-')
map('n', '<A-k>', '<C-w>+')
map('n', '<A-l>', '<C-w><')
map({'n', 'v'}, 'Q', '<cmd>q<CR>', {desc = "Quit current window"})
-- Nvim-Tree toggle
map('n', '<C-n>', '<cmd>NvimTreeToggle<CR>', {desc = "NvimTree"})
-- Toggle terminal
map({'n', 'v', 'i'}, '<F4>', '<cmd>ToggleTerm<CR>')
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
map('n', 'r', '<C-r>', {desc= "Redo"})
