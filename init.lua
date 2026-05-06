require("config.lazy")
require("config.options")
require("config.keymaps")
require("config.tabline").setup()
require("config.quickfix")
require("config.autocmds")

-- TODO: Add gitsigns.nvim
-- TODO: Fix treesitter not enabling automatically (vim.treesitter.start() must be called manually some times)
