-- keybinds
local map = vim.keymap.set

-- Movment
map({ "n", "v" }, "H", "<S-Left>", { desc = "Move 1 word to the left" })
map({ "n", "v" }, "L", "<S-Right>", { desc = "Move 1 word to the right" })
-- Delte without copying
-- map({'n', 'v', 'x'}, 'dd', '"_dd')
-- Fast exit to normal mode
map("i", "jk", "<Esc>", { desc = "Exit insert mode" })
-- Cancel highlightning when searching
map("n", "<ESC><ESC>", "<cmd>nohlsearch<CR>")
-- Fast switch window
map({ "n", "v" }, "!", "<C-w>w")
-- Fast window switch
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")
-- Open Telescope
map("n", ";", "<cmd>Telescope<CR>", { desc = "Open Telescope" })
map("n", ";g", "<cmd>Telescope live_grep<CR>", { desc = "Live Grep" })
map("n", ";G", "<cmd>Telescope git_files<CR>", { desc = "Git Files" })
map("n", "<F2>", "<cmd>Telescope find_files<CR>", { desc = "Find Files" })
-- Open Nvim Tree
map("n", "<F3>", "<cmd>NvimTreeToggle<CR>", { desc = "Open Nvim Tree" })
-- Buffer managing
map("n", "bd", "<cmd>bdel<CR>", { desc = "Delete current buffer" })
map("n", "<Tab>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
map("n", "<S-Tab>", "<cmd>bnext<CR>", { desc = "Next buffer" })
-- Splits
map("n", "Sh", ":split ", { desc = "Horizzontal Split" })
map("n", "Sv", ":vsplit ", { desc = "Vertical Split" })
map("n", "<A-h>", "<C-w>>")
map("n", "<A-j>", "<C-w>-")
map("n", "<A-k>", "<C-w>+")
map("n", "<A-l>", "<C-w><")
map({ "n", "v" }, "Q", "<cmd>bd!<CR>", { desc = "Quit current buffer" })
-- LSP
map({ "n", "v" }, "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
map({ "n", "v" }, "gr", vim.lsp.buf.references, { desc = "Go to Reference" })
map({ "n", "v" }, "cs", vim.lsp.buf.signature_help, { desc = "Signature Help" })
map("n", "cf", function()
	vim.lsp.buf.format({ async = true })
end, { desc = "Code Format" })
map("n", "ca", "<cmd>Lspsaga code_action<CR>", { desc = "Code Actions" })
map("n", "cd", "<cmd>Lspsaga hover_doc<CR>", { desc = "LSP Code Doc" })
map("n", "cr", ":IncRename ", { desc = "LSP Rename" })
map("n", "c[", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { desc = "Go to Previous Diagnostic" })
map("n", "c]", "<cmd>Lspsaga diagnostic_jump_next<CR>", { desc = "Go to Next Diagnostic" })
-- Text modification
map("v", "<S-Down>", "<cmd>m .+1<CR>", { desc = "Move line down" })
map("v", "<S-Up>", "<cmd>m .-2<CR>", { desc = "Move line up" })
map("v", "P", '"_dP', { desc = "Delete and paste" })
-- Undotree
map("n", "U", "<cmd>UndotreeToggle<CR>", { desc = "Open undo history" })
-- Indent whole page
map("n", "==", function()
	local c = vim.fn.getpos(".")
	local v = vim.fn.winsaveview()
	vim.cmd.normal("ggVG==")
	vim.fn.setpos(".", c)
	vim.fn.winrestview(v)
end, { desc = "Indent whole page" })
-- Open precognition
map("n", "<space><space>", function()
	require("precognition").peek()
end, { desc = "Precognition" })
