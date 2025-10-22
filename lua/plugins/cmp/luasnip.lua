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
      s({ trig = "guard", desc = "Header Guard"},
        fmt(
          [[
          #ifndef H_{}
          #define H_{}


          #endif // !{}
          ]],{
            i(1, "HEADER"),
            rep(1),
            rep(1),
          }
        )
      ),
    })

		ls.add_snippets("cmake", {
			s(
				{ trig = "init", desc = "Inizialize C++ Project" },
				fmt(
					[[
        # -[-[ CMake Build File ]-]-
        cmake_minimum_required(VERSION {})
        set(BUILD_INFO "${{CXX_COMPILER_NAME}} ${{CMAKE_CXX_COMPILER_VERSION}} - ${{CMAKE_BUILD_TYPE}}")

        # -[-[ Project ]-]-
        project( {} VERSION {} DESCRIPTION "{}")

        # -[-[ Build Properties ]-]-
        set(CMAKE_BUILD_TYPE "{}")
        set(CMAKE_CXX_STANDARD {})
        set(CMAKE_CXX_STANDARD_REQUIRED TRUE)
        set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${{PROJECT_BINARY_DIR}}/bin")

        # -[-[ Source Files and Libraries ]-]-
        add_subdirectory("./src")

        # -[-[ Project Status ]-]-
        message(STATUS "")
        message(STATUS "-[-[ Build Info ]-]-")
        message(STATUS "Configuring project: ${{PROJECT_NAME}}")
        if(NOT "${{PROJECT_DESCRIPTION}}" STREQUAL "")
          message(STATUS "Project Description: ${{PROJECT_DESCRIPTION}}")
        endif()
        message(STATUS "Bin Dir: ${{CMAKE_RUNTIME_OUTPUT_DIRECTORY}}")
        message(STATUS "Build Type: ${{CMAKE_BUILD_TYPE}}")
        message(STATUS "C++ Standard: ${{CMAKE_CXX_STANDARD}}")
        message(STATUS "Build info: ${{BUILD_INFO}}")
        ]],
					{
						i(1, "CMAKE_VERSION (>=3.5)"),
						i(2, "PROJECT_NAME"),
						i(3, "1.0"),
						i(4),
						i(5, "Debug|Release|RelWithDebInfo|MinSizeRel"),
						i(6, "CXX_STANDARD"),
					}
				)
			),
			s(
				{ trig = "src", desc = "Setup Sources" },
				fmt(
					[[
        # -[-[ Sources Build ]-]-

        file(GLOB SRC *.cpp)
        add_executable(${{PROJECT_NAME}} ${{SRC}})
        ]],
					{}
				)
			),
			s({ trig = "lib", desc = "Link library" }, {
				t('target_link_libraries(${{PROJECT_NAME}} "{}")'),
				i(1, "LIB_NAME"),
			}),
		})

		ls.add_snippets("gitignore", {
			s({ trig = "cmake", desc = "Add CMake cache" }, {
				t("build/"),
			}),
		})

		ls.add_snippets("just", {
			s(
				{ trig = "java", desc = "Setup Java Build Environment" },
				fmt(
					[[
        srcdir := "./src"
        bindir := "./bin"
        docdir := "./docs"
        JAVAC_FLAGS := "" # -verbose

        # Build Informations
        module := "{}"
        package := "{}"
        class := "{}"
        jarfile := class + ".jar"

        build:
          javac -d {{{{bindir}}}} --module-source-path {{{{srcdir}}}} --module {{{{module}}}} {{{{JAVAC_FLAGS}}}}

        run: build
          java --module-path {{{{bindir}}}} --module {{{{module}}}}/{{{{package}}}}.{{{{class}}}}

        doc:
          javadoc -d {{{{docdir}}}} --module-source-path {{{{srcdir}}}} -author 
        ]],
					{
						i(1, "MAIN_MODULE"),
						i(2, "test"),
						i(3, "MAIN_CLASS"),
					}
				)
			),
		})
	end,
}
