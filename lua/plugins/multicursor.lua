return {
	"jake-stewart/multicursor.nvim",
	-- keys = "",
	branch = "1.0",
	config = function()
		local mc = require("multicursor-nvim")
		mc.setup()

		local set = vim.keymap.set

		set({ "n", "x" }, "<right>", function()
			mc.lineAddCursor(1)
		end)
		set({ "n", "x" }, "<left>", function()
			mc.lineAddCursor(-1)
		end)
		set({ "n", "x" }, "<down>", function()
			mc.lineSkipCursor(1)
		end)
		set({ "n", "x" }, "<up>", function()
			mc.lineSkipCursor(-1)
		end)

		set({ "n", "x" }, "<C-right>", function()
			mc.matchAddCursor(1)
		end)
		set({ "n", "x" }, "<C-left>", function()
			mc.matchAddCursor(-1)
		end)
		set({ "n", "x" }, "<C-down>", function()
			mc.matchSkipCursor(1)
		end)
		set({ "n", "x" }, "<C-up>", function()
			mc.matchSkipCursor(-1)
		end)
		set({ "n", "x" }, "<C-q>", mc.toggleCursor)

		mc.addKeymapLayer(function(layerSet)
			layerSet({ "n", "x" }, "<S-Tab>", mc.prevCursor)
			layerSet({ "n", "x" }, "<Tab>", mc.nextCursor)
			layerSet({ "n", "x" }, "<C-x>", mc.deleteCursor)

			layerSet({ "n", "x" }, "<esc>", function()
				if mc.cursorsEnabled() then
					mc.clearCursors()
				end
			end)
		end)
	end,
}
