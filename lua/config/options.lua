-- stylua: ignore start
-- Globals
vim.g.loaded_netrw = 1          -- Disable netrw
vim.g.loaded_netrwPlugin = 1    -- Disable netrw
vim.g.showcmdloc = "statusline" -- Show command message location

vim.opt.sessionoptions = {      -- Required by scope.nvim
  "buffers",
  "tabpages",
  "globals",
}

-- Locals
local options = {
  relativenumber = false,     -- Set Relative Number line
  number = false,             -- Set Number line
  inccommand = "split",       -- Command preview (eg. `%s/.../...`)
  ignorecase = true,          -- Ignore uppercase and lowercase in commands
  infercase = true,           -- Search for unsensitive case
  laststatus = 3,             -- Set global statusbar
  scrolloff = 4,              -- Lines above and under cursorline
  updatetime = 250,           -- Set updatetime for events
  timeoutlen = 300,           -- Timeout for events
  showmode = false,           -- Hide --INSERT-- messages etc...
  splitbelow = true,          -- Always split below
  splitright = true,          -- Always split right
  undofile = true,            -- Enable persistent undo
  cursorline = true,          -- Enable cursorline
  termguicolors = true,       -- Enable termguicolors
  tabstop = 2,                -- Set tabstop
  softtabstop = 2,            -- Soft tabstop
  shiftwidth = 2,             -- Set shiftwidth
  expandtab = true,           -- Expand tabs into spaces
  autochdir = true,           -- Auto change directory
  clipboard = "unnamedplus",  -- Sync with system clipboard
  wrap = false,               -- Disable line wrap
  grepprg = "rg --vimgrep",   -- Use ripgrep instead of grep
  grepformat = "%f:%l:%c:%m", -- Grep formatting
  formatexpr = "v:lua.require'conform'.formatexpr()",
  mousemodel = "extend",      -- Right click extend selection
  fillchars = {
    eob = " ",
    vert = " ",
    horiz = " ",
    diff = "╱",
    foldopen = "",
    foldclose = "",
    fold = " ",
    msgsep = "─",
  }, -- Fill chars
  listchars = {
    trail = "·",
  },                    -- List chars
  conceallevel = 2,     -- Font conceal
  signcolumn = "yes:1", -- Draw signs on statuscolumn
  writebackup = false,   -- No backups of files
  swapfile = false,      -- No swap file
  smartcase = true,     -- Ignore ignorecase if case all uppercase
  gdefault = true,      -- Always substitute globally
  path = { ".", "**" }, -- Search path
  splitkeep = "screen", -- Keep text on screen line
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- stylua: ignore end
