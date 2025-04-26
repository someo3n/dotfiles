return {
	{
		'hrsh7th/cmp-nvim-lsp'
	},
	{
		'L3MON4D3/LuaSnip',
		dependencies = {
			'saadparwaiz1/cmp_luasnip',
			'rafamadriz/friendly-snippets'
		}
	},
	{
		'hrsh7th/nvim-cmp',
		config = function()
			local cmp = require('cmp')
			require('luasnip.loaders.from_vscode').lazy_load()

			cmp.setup({
				view = {
					entries = { name = 'custom', selection_order = 'near_cursor' }
				},
				snippet = {
					expand = function(args)
						require('luasnip').lsp_expand(args.body)
					end
				},
				window = {
					completion = cmp.config.window.bordered({
						winhighlight = 'Normal:Pmenu,CursorLine:Visual,Search:None',
					}),
					documentation = cmp.config.window.bordered({
						winhighlight = 'Normal:Pmenu,CursorLine:Visual,Search:None',
					})
				},
				mapping = cmp.mapping.preset.insert({
					['<C-b>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-Space>'] = cmp.mapping.complete(),
					['<C-e>'] = cmp.mapping.abort(),
					['<Tab>'] = cmp.mapping.confirm({ select = true })
				}),
				sources = cmp.config.sources({
					{ name = 'nvim_lsp' },
					{ name = 'luasnip' }
				}, {
					{ name = 'buffer' }
				}),
				formatting = {
					format = function(_, vim_item)
						local kind_icons = {
							Text = 'T', -- Text
							Method = '', -- Function
							Function = '', -- Function
							Constructor = '', -- Constructor
							Field = '', -- Field
							Variable = '', -- Variable
							Class = '', -- Class
							Interface = '', -- Interface
							Module = '', -- Module
							Property = '', -- Property
							Unit = '', -- Unit
							Value = '', -- Value
							Enum = '', -- Enum
							Keyword = '', -- Keyword
							Snippet = '', -- Snippet
							Color = '', -- Color
							File = '󰈔', -- File
							Reference = '*', -- Reference
							Folder = '', -- Folder
							EnumMember = '', -- EnumMember
							Constant = '', -- Constant
							Struct = '', -- Struct
							Event = '', -- Event
							Operator = '', -- Operator
							TypeParameter = '', -- TypeParameter
						}
						-- Assign an icon based on the kind of completion item
						vim_item.kind = kind_icons[vim_item.kind] or vim_item.kind
						return vim_item
					end
				}
			})
		end
	}
}
