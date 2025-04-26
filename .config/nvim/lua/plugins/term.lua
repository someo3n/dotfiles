return {
	'akinsho/toggleterm.nvim',
	version = '*',
	config = function()
		require('toggleterm').setup({
			open_mapping = [[<c-\>]],
			direction = 'float',
			float_opts = { border = 'single' }
		})

		vim.keymap.set('n', '<leader>tf', '<cmd>ToggleTerm direction=float<CR>', {})
	end
}
