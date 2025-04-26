local lsps = { 'html', 'lua_ls', 'cssls', 'ts_ls', 'pyright' }

return {
	{
		'williamboman/mason.nvim',
		lazy = false,
		opts = {
			auto_install = true
		},
		config = function()
			require('mason').setup()
		end
	},
	{
		'williamboman/mason-lspconfig.nvim',
		lazy = false,
		opts = {
			auto_install = true
		},
		config = function()
			require('mason-lspconfig').setup({
				ensure_installed = lsps
			})
		end
	},
	{
		'neovim/nvim-lspconfig',
		config = function()
			local t = require('telescope.builtin')
			local c = require('cmp_nvim_lsp').default_capabilities()
			local l = require('lspconfig')

			vim.filetype.add({ extension = { templ = 'templ' } })

			local function on_attach(client, buf)
				if not client.server_capabilities.documentFormattingProvider then return end
				vim.api.nvim_create_autocmd('BufWritePre', {
					buffer = buf,
					callback = function()
						vim.lsp.buf.format({ bufnr = buf })
					end
				})
			end

			for _, lsp in ipairs(lsps) do
				if lsp == 'html' then goto continue end

				l[lsp].setup({
					capabilities = c,
					on_attach = on_attach
				})

				::continue::
			end

			l.html.setup({
				capabilities = c,
				filetypes = { 'html', 'templ' },
				on_attach = on_attach
			})

			vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
			vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
			vim.keymap.set('n', '<leader>d', t.diagnostics, {})
			vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, {})

			vim.diagnostic.config({
				signs = false,
				virtual_text = {
					prefix = '*',
					spacing = 4
				},
				update_in_insert = true
			})
		end
	}
}
