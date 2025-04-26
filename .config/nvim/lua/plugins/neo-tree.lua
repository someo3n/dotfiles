return {
	'nvim-neo-tree/neo-tree.nvim',
	branch = 'v3.x',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-tree/nvim-web-devicons',
		'MunifTanjim/nui.nvim'
	},
	config = function()
		local command = require('neo-tree.command')
		vim.keymap.set('n', '<C-n>', function ()
			command.execute({ toggle = false, position = 'right' })
		end, { noremap = true, silent = true })
	end
}
