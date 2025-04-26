return {
	{
		'hrsh7th/cmp-nvim-lsp',
	},
	{
		'hrsh7th/nvim-cmp',
		config = function()
			local cmp = require 'cmp'
			cmp.setup {
				view = {
					entries = { name = 'custom', selection_order = 'near_cursor' },
				},
				snippet = {
					expand = function(args)
						require('luasnip').lsp_expand(args.body)
					end,
				},
				window = {
					completion = {
						winhighlight = 'Normal:Pmenu,CursorLine:Visual,Search:None',
					},
					documentation = {
						winhighlight = 'Normal:Pmenu,CursorLine:Visual,Search:None',
					},
				},
				mapping = cmp.mapping.preset.insert({
					['<C-b>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-Space>'] = cmp.mapping.complete(),
					['<C-e>'] = cmp.mapping.abort(),
					['<Tab>'] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = 'nvim_lsp' },
				}, {
					{ name = 'buffer' },
				}),
				formatting = {
					format = function(_, vim_item)
						local kind_icons = {
							Text = 'T',
							Method = '',
							Function = '',
							Constructor = '',
							Field = '',
							Variable = '',
							Class = '',
							Interface = '',
							Module = '',
							Property = '',
							Unit = '',
							Value = '',
							Enum = '',
							Keyword = '',
							Snippet = '',
							Color = '',
							File = '󰈔',
							Reference = '*',
							Folder = '',
							EnumMember = '',
							Constant = '',
							Struct = '',
							Event = '',
							Operator = '',
							TypeParameter = '',
						}

						vim_item.kind = kind_icons[vim_item.kind] or vim_item.kind
						return vim_item
					end,
				},
			}
		end,
	},
}

