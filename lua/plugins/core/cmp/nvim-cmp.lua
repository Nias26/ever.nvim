return {
	"hrsh7th/nvim-cmp",
	lazy = true,
   config = function()
   	-- Set up nvim-cmp.
      local cmp = require'cmp'
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local has_words_before = function()
      	unpack = unpack or table.unpack
         local line, col = unpack(vim.api.nvim_win_get_cursor(0))
         return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

		local luasnip = require("luasnip")
		cmp.setup({
			snippet = {
				expand = function(args)
					require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
				end,
			},
			window = {
				completion = {
					-- winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
					col_offset = -3,
					side_padding = 0,
				},
				documentation = {
					border = nil,
					scrollbar = '|',
				},
			},
			formatting = {
				fields = { "kind", "abbr", "menu" },
				format = function(entry, vim_item)
					local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
					local strings = vim.split(kind.kind, "%s", { trimempty = true })
					kind.kind = " " .. (strings[1] or "") .. " "
					kind.menu = "    (" .. (strings[2] or "") .. ")"
					return kind
				end,
				require('lspkind').cmp_format({
					mode = "symbol",
	            maxwidth = 50,
	            ellipsis_char = '...',
	            symbol_map = { Codeium = "", }
				}),
			},
			mapping = cmp.mapping({
				['<C-Down>'] = cmp.mapping.scroll_docs(-4),
				['<C-Up>'] = cmp.mapping.scroll_docs(4),
				['|'] = cmp.mapping.abort(),
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
							cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
						else
							fallback()
						end
					end,
				}),
			}),
			sources = cmp.config.sources({
				{ name = 'nvim_lsp' },
				{ name = 'luasnip' }, -- For luasnip users.
				{ name = 'buffer' },
				{ name = 'fonts', option = { space_filter = "-" } },
				{ name =  'look',  keyword_length = 2, option = {
					convert_case = true,
					loud = true,
					dict = '/usr/share/dict/words'
				}},
				{ name = 'nvim_lsp_signature_help' },
				{ name = 'calc' },
				{ name = 'treesitter' },
				{ name = 'path' },
				{ name = 'neorg' },
				{ name = 'nvim_lua' },
				{ name = "codeium" },
			}),
			enabled = function()
				-- disable completion in comments
				local context = require 'cmp.config.context'
				-- keep command mode completion enabled when cursor is in a comment
				if vim.api.nvim_get_mode().mode == 'c' then
					return true
				else
					return not context.in_treesitter_capture("comment")
					and not context.in_syntax_group("Comment")
				end
			end,
			enabled = function()
				return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
			end,
			cmp.event:on(
			'confirm_done',
			cmp_autopairs.on_confirm_done()
			),
			-- formatting = {
				-- format = function(entry, vim_item)
					-- local lspkind_ok, lspkind = pcall(require, "lspkind")
					-- if not lspkind_ok then
						--From kind_icons array
						-- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
					   -- Source
					   -- vim_item.menu = ({
						   -- buffer = "[Buffer]",
						   -- nvim_lsp = "[LSP]",
						   -- luasnip = "[LuaSnip]",
						   -- nvim_lua = "[Lua]",
						   -- latex_symbols = "[LaTeX]",
						-- })[entry.source.name]
						-- return vim_item
					-- else
						-- From lspkind
						-- return lspkind.cmp_format()(entry, vim_item)
					-- end
				-- end
			-- },
		})

		-- Set configuration for specific filetype.
		cmp.setup.filetype('gitcommit', {
			sources = cmp.config.sources({
				{ name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
			}, {
				{ name = 'buffer' },
			})
		})

		-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline({ '/', '?' }, {
			mapping = cmp.mapping.preset.cmdline(),
				view = {
					entries = { name = 'wildmenu', separator = '|' }
				},
				sources = {
					{ name = 'buffer' }
				}
		})

		-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline(':', {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = 'path' }
			}, {
				{ name = 'cmdline' },
				{ name = 'fuzzy_path', option = {fd_timeout_msec = 1500} }
			})
		})

			-- Set up lspconfig.
			--require'lspconfig'.clangd.setup{
				-- capabilities = capabilities,
			--}
	end
}
