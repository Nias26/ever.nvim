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
vim.keymap.set("n", "<leader>[", "<cmd>tabprevious<CR>", { desc = "Previous tab" })
vim.keymap.set("n", "<leader>]", "<cmd>tabnext<CR>", { desc = "Next tab" })

-- Remove highlightning
vim.keymap.set("n", "<ESC><ESC>", "<cmd>nohlsearch<CR>")

-- Comment
vim.keymap.set("n", "cc", "gcc", { desc = "Comment line", remap = true })
vim.keymap.set("v", "cc", "gc", { desc = "Comment selection", remap = true })

-- Buffer managing
vim.keymap.set("n", "<Tab>", "<cmd>bnext<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<S-Tab>", "<cmd>bprevious<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<C-Q>", "<cmd>bd<CR>", { desc = "Quit current buffer" })
vim.keymap.set("n", "Q", "<cmd>bd!<CR>", { desc = "Quit current buffer [force]" })

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

-- dap.ui
vim.keymap.set("n", "<leader>cd", function()
	require("dapui").toggle()
end, { desc = "Debug Adapter Protocol" })
