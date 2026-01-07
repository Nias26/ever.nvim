-- Movment
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to the left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to the down window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to the up window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to the left window" })
vim.keymap.set("n", "<C-w><", "10<C-w><", { desc = "Decrease width" })
vim.keymap.set("n", "<C-w>>", "10<C-w>>", { desc = "Increase width" })
vim.keymap.set("n", "<C-W>+", "10<C-W>+", { desc = "Increase Height" })
vim.keymap.set("n", "<C-W>-", "10<C-W>-", { desc = "Decrease Height" })
vim.keymap.set("n", "!", "<C-w>w")
vim.keymap.set("t", "<C-n>", "<C-\\><C-n>", { desc = "Exit terminal mode", noremap = true, silent = true })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv", { desc = "Move line upwards", silent = true })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv", { desc = "Move line downwards", silent = true })

-- Tabs
vim.keymap.set("n", "<leader>t", "<cmd>tabnew<CR>", { desc = "Create new Tab" })
vim.keymap.set("n", "<leader>D", "<cmd>tabclose<CR>", { desc = "Close current Tab" })
vim.keymap.set("n", "[", "<cmd>tabprevious<CR>", { desc = "Previous tab" })
vim.keymap.set("n", "]", "<cmd>tabnext<CR>", { desc = "Next tab" })

-- Remove highlightning
vim.keymap.set("n", "<ESC><ESC>", "<cmd>nohlsearch<CR>")

-- Open Telescope
vim.keymap.set("n", ";;", "<cmd>Telescope<CR>", { desc = "Telescope" })
vim.keymap.set("n", ";G", "<cmd>Telescope live_grep<CR>", { desc = "Live Grep" })
vim.keymap.set("n", ";g", "<cmd>Telescope git_files<CR>", { desc = "Git Files" })
vim.keymap.set("n", "<F2>", "<cmd>Telescope find_files<CR>", { desc = "Find Files" })
vim.keymap.set("n", ";s", "<cmd>Telescope file_browser<CR>", { desc = "File Browser" })
vim.keymap.set("n", ";b", "<cmd>Telescope buffers<CR>", { desc = "Buffers" })
vim.keymap.set("n", ";h", "<cmd>Telescope help_tags<CR>", { desc = "Help Tags" })
vim.keymap.set("n", ";m", "<cmd>Telescope man_pages<CR>", { desc = "Man Pages" })
vim.keymap.set("n", ";f", "<cmd>Telescope find_files<CR>", { desc = "Find Files" })
vim.keymap.set("n", ";x", "<cmd>Telescope oldfiles<CR>", { desc = "Old Files" })

-- Comment
vim.keymap.set("n", "cc", "gcc", { desc = "Comment line", remap = true })
vim.keymap.set("v", "Cc", "gc", { desc = "Comment selection", remap = true })

-- Open Nvim Tree
vim.keymap.set("n", "<F3>", "<cmd>Neotree source=filesystem toggle<CR>", { desc = "Open Nvim Tree (Sizebar)" })
vim.keymap.set("n", "<F4>", "<cmd>Neotree position=current toggle<CR>", { desc = "Open Nvim Tree (Full)" })

-- Buffer managing
vim.keymap.set("n", "<Tab>", "<cmd>bnext<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<S-Tab>", "<cmd>bprevious<CR>", { desc = "Next buffer" })

-- Splits
vim.keymap.set("n", "Ss", ":split ", { desc = "Horizzontal Split" })
vim.keymap.set("n", "Sv", ":vsplit ", { desc = "Vertical Split" })
vim.keymap.set("n", "Q", "<cmd>bd<CR>", { desc = "Quit current buffer" })

-- LSP
vim.keymap.set({ "n", "v" }, "gd", vim.lsp.buf.definition, { desc = "Goto Definition" })
vim.keymap.set({ "n", "v" }, "gr", vim.lsp.buf.references, { desc = "Goto Reference" })
vim.keymap.set({ "n", "v" }, "cs", vim.lsp.buf.signature_help, { desc = "Signature Help" })
vim.keymap.set("n", "cf", function()
	vim.lsp.buf.format({ async = true })
end, { desc = "Code Format" })
vim.keymap.set("n", "cz", "<cmd>Lspsaga code_action<CR>", { desc = "Code Actions" })
vim.keymap.set("n", "cd", "<cmd>Lspsaga hover_doc<CR>", { desc = "Code Documentation" })
vim.keymap.set("n", "gr", "<cmd>Lspsaga finder<CR>", { desc = "Find References" })
vim.keymap.set("n", "cr", vim.lsp.buf.rename, { desc = "Rename Symbol" })
vim.keymap.set("n", "c[", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { desc = "Previous Diagnostic" })
vim.keymap.set("n", "c]", "<cmd>Lspsaga diagnostic_jump_next<CR>", { desc = "Next Diagnostic" })
vim.keymap.set("n", "cl", vim.lsp.codelens.run, { desc = "CodeLens Action" })

-- Undotree
vim.keymap.set("n", "U", "<cmd>UndotreeToggle<CR>", { desc = "Open undo history" })

-- Indent whole page
vim.keymap.set("n", "==", function()
	local c = vim.fn.getpos(".")
	local v = vim.fn.winsaveview()
	vim.cmd.normal("ggVG==")
	vim.fn.setpos(".", c)
	vim.fn.winrestview(v)
end, { desc = "Indent whole page" })

-- Grug-far
vim.keymap.set("n", ";r", function()
	require("grug-far").open({
		prefills = {
			search = vim.fn.expand("<cword>"),
			paths = vim.fn.expand("%:p"),
		},
	})
end, { desc = "Grug-Far" })

-- Toggle (relative)numbers
vim.keymap.set("n", "<F5>", function()
	vim.wo.nu = not vim.wo.nu
	vim.wo.rnu = not vim.wo.rnu
end, { desc = "Toggle Numbers", noremap = true })
vim.keymap.set("n", "<F6>", function()
	vim.wo.nu = not vim.wo.nu
end, { desc = "Toggle Relative Numbers", noremap = true })

-- Get help
vim.keymap.set("n", "<F1>", function()
	local line = vim.fn.getline(".")
	local cword = vim.fn.expand("<cword>")
	line = line:sub(1, select(2, line:find(cword)))
	local match = line:gmatch("vim%.[%w_.]+") -- get all word with vim.
	local word = nil

	for w in match do
		word = w
	end

	if not word then
		return
	end

	-- Rokudo's Bad Girls
	local bad_girls = {
		"vim.fn",
		"vim.cmd",
		"vim.w",
		"vim.o",
		"vim.b",
		"vim.g",
	}

	for _, bad in ipairs(bad_girls) do
		if word and word:match("^" .. bad) then
			word = bad
		end
	end

	vim.cmd.help(word)
end, { desc = "Get help" })
