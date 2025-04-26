return {
	'stevearc/oil.nvim',
	config = function()
		require('oil').setup {
			view_options = {
				show_hidden = true,
			},
		}

		vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'open parent directory' })
	end,
}
