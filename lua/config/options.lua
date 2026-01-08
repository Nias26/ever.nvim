-- stylua: ignore start
-- Globals
vim.g.loaded_netrw = 1                                                              -- Disable netrw
vim.g.loaded_netrwPlugin = 1                                                        -- Disable netrw
vim.g.showcmdloc = "statusline"                                                     -- Show command message location

-- Disable language provider support (lua and vimscript plugins only)
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_python3_provider = 0


vim.opt.sessionoptions = {                                                          -- Required by scope.nvim
  "buffers",
  "tabpages",
  "globals",
}

-- Locals
local options = {
  relativenumber = false,                                                           -- Set Relative Number line
  number = false,                                                                   -- Set Number line
  inccommand = "split",                                                             -- Command preview (eg. `%s/.../...`)
  ignorecase = true,                                                                -- Ignore uppercase and lowercase in commands
  infercase = true,                                                                 -- Search for unsensitive case
  laststatus = 3,                                                                   -- Set global statusbar
  scrolloff = 4,                                                                    -- Lines above and under cursorline
  updatetime = 250,                                                                 -- Set updatetime for events
  timeoutlen = 250,                                                                 -- Timeout for events
  showmode = false,                                                                 -- Hide --INSERT-- messages etc...
  splitbelow = true,                                                                -- Always split below
  splitright = true,                                                                -- Always split right
  undofile = true,                                                                  -- Enable persistent undo
  cursorline = true,                                                                -- Enable cursorline
  termguicolors = true,                                                             -- Enable termguicolors
  tabstop = 2,                                                                      -- Set tabstop
  softtabstop = 2,                                                                  -- Soft tabstop
  shiftwidth = 2,                                                                   -- Set shiftwidth
  expandtab = true,                                                                 -- Expand tabs into spaces
  autochdir = true,                                                                 -- Auto change directory
  clipboard = "unnamedplus",                                                        -- Sync with system clipboard
  wrap = false,                                                                     -- Disable line wrap
  grepprg = "rg --vimgrep --smart-case",                                            -- Use ripgrep instead of grep
  grepformat = "%f:%l:%c:%m",                                                       -- Grep formatting
  formatexpr = "v:lua.require'conform'.formatexpr()",                               -- Format function
  mousemodel = "extend",                                                            -- Right click extend selection
  fillchars = {
    eob = " ",
    vert = " ",
    horiz = " ",
    diff = "╱",
    foldopen = "",
    foldclose = "",
    fold = " ",
    msgsep = "─",
  },                                                                                -- Fill chars
  listchars = {
    trail = "·",
  },                                                                                -- List chars
  conceallevel = 2,                                                                 -- Font conceal
  signcolumn = "yes:1",                                                             -- Draw signs on statuscolumn
  writebackup = false,                                                              -- No backups of files
  swapfile = false,                                                                 -- No swap file
  smartcase = true,                                                                 -- Ignore ignorecase if case all uppercase
  gdefault = true,                                                                  -- Always substitute globally
  path = { ".", "**" },                                                             -- Search path
  splitkeep = "screen",                                                             -- Keep text on screen line
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

if vim.g.neovide then
  vim.o.guifont = "FiraCode Nerd Font:h9"
end

-- Set Virtual text
vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
	seveirty_sort = false,
	float = {
		source = true,
	},
})

-- stylua: ignore end
