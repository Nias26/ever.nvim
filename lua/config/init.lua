require("config.options")
require("config.keymaps")

for file in vim.fs.dir(vim.fs.joinpath(vim.fn.stdpath("config"), "lua/config/modules")) do
	file = file:match("(.*)%.")
	if file then
		require("config.modules." .. file).setup()
	end
end

require("config.autocmds")
