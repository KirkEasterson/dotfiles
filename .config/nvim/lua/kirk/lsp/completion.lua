local cmp = require('cmp')

local ok, lspkind = pcall(require, "lspkind")
if not ok then
	return
end

lspkind.init()

cmp.setup({
	mapping = {
		["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
		["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-e>"] = cmp.mapping.abort(),
		["<c-y>"] = cmp.mapping(
			cmp.mapping.confirm {
				behavior = cmp.ConfirmBehavior.Insert,
				select = true,
			},
			{
				"i",
				"c",
			}
		),
		["<c-space>"] = cmp.mapping {
			i = cmp.mapping.complete(),
			c = function(
			_ --[[fallback]]
			)
				if cmp.visible() then
					if not cmp.confirm { select = true } then
						return
					end
				else
					cmp.complete()
				end
			end,
		},
	},

	sources = cmp.config.sources({
		{ name = 'luasnip' },
		{ name = 'nvim_lsp' },
		{ name = 'path' },
		{ name = 'spell' },
	}, {
		{ name = 'buffer' },
	}),

	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},

	formatting = {
		format = lspkind.cmp_format {
			ellipsis_char = '…',
			with_text = true,
			menu = {
				buffer = "[buf]",
				gh_issues = "[issues]",
				luasnip = "[snip]",
				nvim_lsp = "[LSP]",
				nvim_lua = "[api]",
				path = "[path]",
				tn = "[TabNine]",
			},
		},
	},

	experimental = {
		native_menu = false,
		ghost_text = true,
	},
})
