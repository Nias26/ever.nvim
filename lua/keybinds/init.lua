-- Which-key Keybinds
local status_ok, _ = pcall(require, "keybinds.which-key")
if not status_ok then
   return
end

-- keybinds
local map = vim.keymap.set

-- Delte without copying
map({'n', 'v', 'x'}, 'dd', '_dd')
-- Cancecl highlightning when searching
map('n', '<ESC><ESC>', '<cmd>noh<CR>')
-- Fast switch window
map({'n', 'v'}, '!', '<C-w>w')
-- Open URL under cursor
map('n', '<C-o>', '<cmd>URLOpenUnderCursor<CR>')
-- Source current file
map('n', '%', '<cmd>source %<CR>')
-- Previous search
map('n', ',', 'N')
-- Next search
map('n', '.', 'n')
-- Fast arrow window switch
map('n', '<A-Left>', '<C-w>h')
map('n', '<A-Down>', '<C-w>j')
map('n', '<A-Up>', '<C-w>k')
map('n', '<A-Right>', '<C-w>l')
-- Comment line
map('n', 'cc', function() require("Comment.api").toggle.linewise() end, {desc = "Comment line"})
-- Open Dropbar
map('n', '<S-D>', '<cmd>lua require("dropbar.api").pick()<CR>', {desc = "Dropbar"})
-- Fold toggle (Current fold)
map('n', 'ff', 'za')
-- Fold toggle (Functionality)
map('n', 'ft', 'zi')
-- Open Telescope
map({'n', 'v'}, 'st', '<cmd>Telescope<CR>', {desc = "Open Telescope"})
-- Buffer managing
map('n', 'bn', function() vim.ui.input({prompt = 'New buffer'}, function(input) f.fcmd('badd', input)end)end, {desc = "New buffer"})
map('n', 'bd', '<cmd>bdel<CR>', {desc = "Delete current buffer"})
map('n', '[', '<cmd>bprevious<CR>', {desc = "Previous buffer"})
map('n', ']', '<cmd>bnext<CR>', {desc = "Next buffer"})
map('n', '<Tab>', '<cmd>bnext<CR>')
map('n', '<S-Tab>', '<cmd>bprevious<CR>')
-- Splits
map('n', 'sh', function() vim.ui.input({prompt = 'Horizzontal split'}, function(input) if input == "" then input = "%" end f.fcmd('split', input) end) end, {desc = "Horizzontal Split"})
map('n', 'sv', function() vim.ui.input({prompt = 'Vertical split'}, function(input) if input == "" then input = "%" end f.fcmd('vsplit', input) end) end, {desc = "Vertical Split"})
map('n', '<C-h>', '<C-w>>')
map('n', '<C-j>', '<C-w>-')
map('n', '<C-k>', '<C-w>+')
map('n', '<C-l>', '<C-w><')
-- Nvim-Tree toggle
map('n', 'oe', '<cmd>NvimTreeToggle<CR>', {desc = "NvimTree"})
-- Toggle terminal
map({'n', 'v', 'i'}, '<F4>', '<cmd>ToggleTerm<CR>')
-- Lazygit
map('n', 'ol', '<cmd>LazyGit<CR>', {desc = "LazyGit"})
-- LSP
map({'n', 'v'}, 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {desc = "Go to definition"})
map({'n', 'v'}, 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', {desc = "Go to references"})
map('n', 'ca', '<cmd>Lspsaga code_action<CR>', {desc = "Code Actions"})
map('n', 'cd', '<cmd>Lspsaga hover_doc<CR>', {desc = "LSP Signature"})
map('n', 'cf', '<cmd>Lspsaga finder<CR>', {desc = "Find References"})
