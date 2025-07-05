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
		local fmt = require("luasnip.extras.fmt").fmt
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

		ls.add_snippets("cmake", {
			s(
				"init",
				fmt(
					[[
        cmake_minimum_required(VERSION {})
        set(CMAKE_CXX_STANDARD {})
        set(CMAKE_CXX_STANDARD_REQUIRED True)
        set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${{{}}}/bin")
        set(CMAKE_BUILD_TYPE "{}")

        project({} VERSION {})

        add_executable({} ../{}.cpp)
        ]],
					{
						i(1, "CMAKE_VERSION (>=3.5)"),
						i(2, "C++_STANDARD"),
						i(3, "CMAKE_BINARY_DIR"),
						i(3, "Debug|Release|RelWithDebInfo|MinSizeRel"),
						i(4, "PROJECT_NAME"),
						i(5, "1.0.0"),
						i(6, "main"),
						i(7, "main"),
					}
				)
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
