return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	config = function()
		local treesitter = require('nvim-treesitter.configs')
		treesitter.setup({
			ensure_installed = { 'lua', 'javascript', 'python', 'html', 'css', 'go', 'c', 'templ' },
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true }
		})
	end
}
