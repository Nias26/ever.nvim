return {
	"utilyre/barbecue.nvim",
	enabled = true,  --lazy_check,
	event = "BufEnter",
   name = "barbecue",
   version = "*",
   dependencies = {
   	"SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
   },
   opts = {},
   config = function()
   	-- triggers CursorHold event faster
      vim.opt.updatetime = 200

		require("barbecue").setup({
      	create_autocmd = false, -- prevent barbecue from updating itself automatically
         --attach_navic = false, -- prevent barbecue from automatically attaching nvim-navic
      })

		vim.api.nvim_create_autocmd({
      	"WinScrolled", -- or WinResized on NVIM-v0.9 and higher
         "BufWinEnter",
         "CursorHold",
         "InsertLeave",
         -- include this if you have set `show_modified` to `true`
         "BufModifiedSet",
      }, {
	      group = vim.api.nvim_create_augroup("barbecue.updater", {}),
         callback = function()
   	      require("barbecue.ui").update()
         end,
      })

      --local function commons(client, bufnr)
      -- if client.server_capabilities.documentSymbolProvider then -- this guard prevents error
      	-- require("nvim-navic").attach(client, bufnr)
      -- end
   end
}

