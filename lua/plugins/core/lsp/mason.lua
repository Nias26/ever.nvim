return {
	"williamboman/mason.nvim",
   config = function ()
   	require("mason").setup({
      	ui = {
         	icons = {
            	package_installed = "",
               package_pending = "󰇚",
               package_uninstalled = ""
            },
            check_outdated_packages_on_open = true,
            border = "none"
         }
      })
   end
}
