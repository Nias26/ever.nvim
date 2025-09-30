-- keybinds
local map = vim.keymap.set

-- Movment
map("n", "<C-h>", "<C-w>h", { desc = "Go to the left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to the down window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to the up window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to the left window" })
map("n", "<C-w><", "10<C-w><", { desc = "Decrease width" })
map("n", "<C-w>>", "10<C-w>>", { desc = "Increase width" })
map("n", "<C-W>+", "10<C-W>+", { desc = "Increase Height" })
map("n", "<C-W>-", "10<C-W>-", { desc = "Decrease Height" })
map("n", "!", "<C-w>w")
map("t", "<C-n>", "<C-\\><C-n>", { desc = "Exit terminal mode", noremap = true, silent = true })
map("v", "<A-k>", ":m '<-2<CR>gv", { desc = "Move line upwards", silent = true })
map("v", "<A-j>", ":m '>+1<CR>gv", { desc = "Move line downwards", silent = true })

-- Tabs
map("n", "<leader>t", "<cmd>tabnew<CR>", { desc = "Create new Tab" })
map("n", "<leader>D", "<cmd>tabclose<CR>", { desc = "Close current Tab" })
map("n", "[", "<cmd>tabprevious<CR>", { desc = "Previous tab" })
map("n", "]", "<cmd>tabnext<CR>", { desc = "Next tab" })

-- Remove highlightning
map("n", "<ESC><ESC>", "<cmd>nohlsearch<CR>")

-- Open Telescope
map("n", ";;", "<cmd>Telescope<CR>", { desc = "Telescope" })
map("n", ";G", "<cmd>Telescope live_grep<CR>", { desc = "Live Grep" })
map("n", ";g", "<cmd>Telescope git_files<CR>", { desc = "Git Files" })
map("n", "<F2>", "<cmd>Telescope find_files<CR>", { desc = "Find Files" })
map("n", ";s", "<cmd>Telescope file_browser<CR>", { desc = "File Browser" })
map("n", ";b", "<cmd>Telescope buffers<CR>", { desc = "Buffers" })
map("n", ";h", "<cmd>Telescope help_tags<CR>", { desc = "Help Tags" })
map("n", ";m", "<cmd>Telescope man_pages<CR>", { desc = "Man Pages" })
map("n", ";f", "<cmd>Telescope find_files<CR>", { desc = "Find Files" })

-- Comment
map("n", "cc", "gcc", { desc = "Comment line", remap = true })
map("v", "Cc", "gc", { desc = "Comment selection", remap = true })

-- Open Nvim Tree
map("n", "<F3>", "<cmd>Neotree source=filesystem toggle<CR>", { desc = "Open Nvim Tree (Sizebar)" })
map("n", "<F4>", "<cmd>Neotree position=current toggle<CR>", { desc = "Open Nvim Tree (Full)" })

-- Buffer managing
map("n", "<Tab>", "<cmd>bnext<CR>", { desc = "Previous buffer" })
map("n", "<S-Tab>", "<cmd>bprevious<CR>", { desc = "Next buffer" })

-- Splits
map("n", "Ss", ":split ", { desc = "Horizzontal Split" })
map("n", "Sv", ":vsplit ", { desc = "Vertical Split" })
map("n", "Q", "<cmd>bd<CR>", { desc = "Quit current buffer" })

-- LSP
map({ "n", "v" }, "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
map({ "n", "v" }, "gr", vim.lsp.buf.references, { desc = "Go to Reference" })
map({ "n", "v" }, "cs", vim.lsp.buf.signature_help, { desc = "Signature Help" })
map("n", "cf", function()
	vim.lsp.buf.format({ async = true })
end, { desc = "Code Format" })
map("n", "ca", "<cmd>Lspsaga code_action<CR>", { desc = "Code Actions" })
map("n", "cd", "<cmd>Lspsaga hover_doc<CR>", { desc = "LSP Code Doc" })
map("n", "gr", "<cmd>Lspsaga finder<CR>", { desc = "Find References" })
map("n", "cr", vim.lsp.buf.rename, { desc = "LSP Rename" })
map("n", "c[", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { desc = "Go to Previous Diagnostic" })
map("n", "c]", "<cmd>Lspsaga diagnostic_jump_next<CR>", { desc = "Go to Next Diagnostic" })

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

-- Grug-far
map("n", ";r", function()
	require("grug-far").open({
		prefills = {
			search = vim.fn.expand("<cword>"),
		},
	})
end, { desc = "Grug-Far" })

-- Toggle (relative)numbers
map("n", "<F5>", function()
	vim.wo.nu = not vim.wo.nu
	vim.wo.rnu = not vim.wo.rnu
end, { desc = "Toggle Numbers", noremap = true })
map("n", "<F6>", function()
	vim.wo.nu = not vim.wo.nu
end, { desc = "Toggle Relative Numbers", noremap = true })
