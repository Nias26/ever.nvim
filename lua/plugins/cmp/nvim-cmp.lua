return {
	"hrsh7th/nvim-cmp",
	event = { "InsertEnter", "CmdlineEnter" },
	dependencies = {
		{
			"onsails/lspkind.nvim",
			opts = {
				-- (requires vscode-codicons font)
				preset = "codicons",
			},
		},
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-cmdline",
	},
	config = function()
		-- Set up nvim-cmp.
		local status_ok, cmp = pcall(require, "cmp")
		if not status_ok then
			return print("Cmp failed to load")
		end

		local status_ok, lspkind = pcall(require, "lspkind")
		if not status_ok then
			return print("Lspkind failed to load")
		end

		local has_words_before = function()
			unpack = unpack or table.unpack
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end

		local status_ok, luasnip = pcall(require, "luasnip")
		if not status_ok then
			return print("Luasnip failed to load")
		end
		cmp.setup({
			-- If you want you can enable ghost text
			experimental = {
				ghost_text = { hl_group = "Comment" },
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body) -- For `luasnip` users.
				end,
			},
			window = {
				completion = {
					col_offset = -3,
					side_padding = 0,
				},
				documentation = {
					border = "solid",
				},
			},
			---@diagnostic disable-next-line: missing-fields
			formatting = {
				fields = { "kind", "abbr", "menu" },
				format = function(entry, vim_item)
					local kind = lspkind.cmp_format({ mode = "symbol_text", maxwidth = 50, ellipsis_char = "..." })(
						entry,
						vim_item
					)
					local strings = vim.split(kind.kind, "%s", { trimempty = true })
					kind.kind = " " .. (strings[1] or "") .. " "
					kind.menu = " " .. (strings[2] or "") .. " "
					return kind
				end,
			},
			mapping = cmp.mapping({
				["<C-d>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["|"] = cmp.mapping.abort(),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
						-- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
						-- that way you will only jump inside the snippet region
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					elseif has_words_before() then
						cmp.complete()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
				["<CR>"] = cmp.mapping({
					i = function(fallback)
						if cmp.visible() and cmp.get_active_entry() then
							cmp.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = false })
						else
							fallback()
						end
					end,
				}),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "lazydev", group_index = 0 },
				-- { name = "nvim_lsp_signature_help" },
				{ name = "luasnip" },
				{ name = "path" },
				{ name = "neorg" },
			}),

			enabled = function()
				local buftype = vim.api.nvim_get_option_value("buftype", { buf = 0 })
				if buftype == "prompt" then
					return false
				end
				return true
			end,
		})

		-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			view = {
				entries = { name = "wildmenu", separator = "|" },
			},
		})

		-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
				{ name = "fuzzy_path", option = { fd_timeout_msec = 1500 } },
			}),
		})

		--[[ local colors = {
			base00 = "#161616",
			base01 = "#262626",
			base02 = "#393939",
			base03 = "#525252",
			base04 = "#dde1e6",
			base05 = "#f2f4f8",
			base06 = "#ffffff",
			base07 = "#08bdba",
			base08 = "#3ddbd9",
			base09 = "#78a9ff",
			base0A = "#ee5396",
			base0B = "#33b1ff",
			base0C = "#ff7eb6",
			base0D = "#42be65",
			base0E = "#be95ff",
			base0F = "#82cfff",
		} ]]

		-- Define highlighting groups
		local hl = vim.api.nvim_set_hl

		hl(0, "CmpItemAbbrDeprecatedDefault", { strikethrough = true })
		hl(0, "CmpItemMenu", { italic = false })
	end,
}
