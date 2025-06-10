return {
	"L3MON4D3/LuaSnip",
	event = "InsertEnter",
	dependencies = { "rafamadriz/friendly-snippets" },
	run = { "make install_jsregexp" },
	config = function()
		require("luasnip.loaders.from_vscode").lazy_load()

		local ls = require("luasnip")
		local s = ls.snippet
		local t = ls.text_node
		local i = ls.insert_node
		local extras = require("luasnip.extras")
		local rep = extras.rep

    -- stylua: ignore
		ls.add_snippets("cpp" , {
			s(
				"guard",{
          t("#ifndef H_"), i(1),
          t({"", "#define H_"}), rep(1),
          t({"", ""}),
          t({"", ""}),
          t({"", "#endif // !"}), rep(1),
        }
			),
		})

		ls.add_snippets("gitignore", {
			s(
				"#cmake",
				fmt(
					[[
        ./build/bin/*
        ./build/CMakeFiles/
        ./build/.cmake/
        ./build/CMakeCache.txt
        ./build/Makefile
        ./build/cmake_install.cmake
        ]],
					{}
				)
			),
		})
	end,
}
