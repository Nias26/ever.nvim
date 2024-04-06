-- Which-key Keybinds
local status_ok, _ = pcall(require, "keybinds.which-key")
if not status_ok then
	return
end

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
-- Previous search
map("n", ",", "N")
-- Next search
map("n", ".", "n")
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
map({ "n", "v" }, "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
map({ "n", "v" }, "gr", vim.lsp.buf.references, { desc = "Go to references" })
map({ "n", "v" }, "cs", vim.lsp.buf.signature_help, { desc = "Signature Help" })
map("n", "cf", function()
	vim.lsp.buf.format({ async = true })
end, { desc = "Code Format" })
map("n", "ca", "<cmd>Lspsaga code_action<CR>", { desc = "Code Actions" })
map("n", "cd", "<cmd>Lspsaga hover_doc<CR>", { desc = "LSP Signature" })
map("n", "cr", ":IncRename ", { desc = "LSP Rename" })
-- Text modification
map("v", "<S-Down>", "<cmd>m .+1<CR>", { desc = "Move line down" })
map("v", "<S-Up>", "<cmd>m .-2<CR>", { desc = "Move line up" })
map("v", "P", '"_dP', { desc = "Delete and paste" })
-- Open telescope-undo
map("n", "U", "<cmd>Telescope undo<CR>", { desc = "Open undo history" })
-- Indent whole page
map("n", "==", "gg=G", { desc = "Indent whole page" })
