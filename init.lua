require("config.lazy")
require("config.options")
require("config.keymaps")
require("config.tabline").setup()
require("config.autocmds")

-- TODO: Fix Conform failing on js files
-- TODO: Fix 'K' keymap getting pressed multiple times
-- TODO: Set some formatting preferences on clang-format inside conform.nvim
