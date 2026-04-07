return {
	"saghen/blink.cmp",
	lazy = true,
	event = { "InsertEnter", "CmdlineEnter" },
	dependencies = {
		{
			"onsails/lspkind.nvim",
			opts = {
				preset = "codicons",
			},
			lazy = true,
		},
		{ "rafamadriz/friendly-snippets", lazy = true },
		{
			"hrsh7th/vim-vsnip",
			config = function()
				vim.g.vsnip_snippet_dir = vim.fn.stdpath("config") .. "/snippets"
				vim.cmd([[
        imap <expr> <Tab>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<Tab>'
        smap <expr> <Tab>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<Tab>'
        imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
        smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
        nmap        s       <Plug>(vsnip-select-text)
        xmap        s       <Plug>(vsnip-select-text)
        nmap        S       <Plug>(vsnip-cut-text)
        xmap        S       <Plug>(vsnip-cut-text)
        ]])
			end,
		},
	},
	version = "1.*",
	config = function()
		require("blink-cmp").setup({
			enabled = function()
				if vim.bo.filetype == "TelescopePrompt" or vim.bo.filetype == "oil" then
					return false
				end
				return true
			end,
			snippets = {
				preset = "vsnip",
			},
			keymap = {
				preset = "enter",
				["<C-n>"] = {
					function(cmp)
						cmp.show({ providers = { "snippets" } })
					end,
				},
				["<Up>"] = { "hide", "fallback" },
				["<Down>"] = { "hide", "fallback" },
				["<CR>"] = { "accept", "fallback" },
				["<S-Tab>"] = { "select_prev", "fallback" },
				["<Tab>"] = { "select_next", "fallback" },
				["|"] = {
					function(cmp)
						if cmp.is_active() then
							cmp.cancel()
						end
					end,
					"fallback",
				},
				["<C-u>"] = { "scroll_documentation_up", "fallback" },
				["<C-d>"] = { "scroll_documentation_down", "fallback" },
			},
			appearance = {
				nerd_font_variant = "normal",
			},
			completion = {
				menu = {
					max_height = 30,
					border = nil,
					winblend = 0,
					scrolloff = 2,
					scrollbar = false,
					auto_show = true,
					draw = {
						padding = { 0, 1 },
						columns = { { "kind_icon" }, { "label", "kind", gap = 1 } },
						components = {
							kind_icon = {
								width = { fill = true },
								text = function(ctx)
									local lspkind = require("lspkind")
									local icon =
										vim.split(lspkind.symbol_map[ctx.kind] or "", "%s", { trimempty = true })
									return " " .. icon[1] .. ctx.icon_gap
								end,
							},
							kind = {
								ellipsis = false,
								width = { fill = false },
								text = function(ctx)
									return ctx.kind
								end,
								highlight = function(_)
									return "BlinkCmpKind"
								end,
							},
						},
					},
				},
				documentation = { auto_show = true },
				ghost_text = { enabled = true },
			},
			cmdline = {
				keymap = {
					["<Tab>"] = { "show", "accept" },
					["<Up>"] = { "select_prev", "fallback" },
					["<Down>"] = { "select_next", "fallback" },
				},
			},
			signature = { enabled = false },
			sources = {
				default = { "lsp", "snippets", "path", "buffer" },
			},
		})

		local hl = vim.api.nvim_set_hl
		local ox = {
			base01 = "#262626",
			base08 = "#3ddbd9",
			base09 = "#78a9ff",
			base10 = "#ee5396",
			base11 = "#33b1ff",
			base12 = "#ff7eb6",
			base13 = "#42be65",
			base14 = "#be95ff",
			base15 = "#82cfff",
		}

		hl(0, "BlinkCmpKind", { bg = "NONE" })
		hl(0, "BlinkCmpGhostText", { link = "Comment" })

		hl(0, "BlinkCmpKindText", { fg = ox.base01, bg = ox.base09 })
		hl(0, "BlinkCmpKindMethod", { fg = ox.base01, bg = ox.base15 })
		hl(0, "BlinkCmpKindFunction", { fg = ox.base01, bg = ox.base11 })
		hl(0, "BlinkCmpKindConstructor", { fg = ox.base01, bg = ox.base10 })
		hl(0, "BlinkCmpKindField", { fg = ox.base01, bg = ox.base12 })
		hl(0, "BlinkCmpKindVariable", { fg = ox.base01, bg = ox.base14 })
		hl(0, "BlinkCmpKindProperty", { fg = ox.base01, bg = ox.base12 })
		hl(0, "BlinkCmpKindClass", { fg = ox.base01, bg = ox.base11 })
		hl(0, "BlinkCmpKindInterface", { fg = ox.base01, bg = ox.base08 })
		hl(0, "BlinkCmpKindStruct", { fg = ox.base01, bg = ox.base11 })
		hl(0, "BlinkCmpKindModule", { fg = ox.base01, bg = ox.base11 })
		hl(0, "BlinkCmpKindUnit", { fg = ox.base01, bg = ox.base13 })
		hl(0, "BlinkCmpKindValue", { fg = ox.base01, bg = ox.base15 })
		hl(0, "BlinkCmpKindEnum", { fg = ox.base01, bg = ox.base09 })
		hl(0, "BlinkCmpKindEnumMember", { fg = ox.base01, bg = ox.base15 })
		hl(0, "BlinkCmpKindKeyword", { fg = ox.base01, bg = ox.base09 })
		hl(0, "BlinkCmpKindConstant", { fg = ox.base01, bg = ox.base10 })
		hl(0, "BlinkCmpKindSnippet", { fg = ox.base01, bg = ox.base13 })
		hl(0, "BlinkCmpKindColor", { fg = ox.base01, bg = ox.base08 })
		hl(0, "BlinkCmpKindFile", { fg = ox.base01, bg = ox.base14 })
		hl(0, "BlinkCmpKindReference", { fg = ox.base01, bg = ox.base10 })
		hl(0, "BlinkCmpKindFolder", { fg = ox.base01, bg = ox.base13 })
		hl(0, "BlinkCmpKindEvent", { fg = ox.base01, bg = ox.base12 })
		hl(0, "BlinkCmpKindOperator", { fg = ox.base01, bg = ox.base11 })
		hl(0, "BlinkCmpKindTypeParameter", { fg = ox.base01, bg = ox.base08 })
	end,
}
