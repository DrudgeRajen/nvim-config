return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
	-- or                              , branch = '0.1.x',
	dependencies = { 'nvim-lua/plenary.nvim' },

	config = function()
		require('telescope')
		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' })
		vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope find git files' })
		vim.keymap.set('n', '<leader>ps', function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") });
		end)
		vim.keymap.set('n', '<leader>uC', builtin.colorscheme, { desc = "List available colorscheme" })
	end
}
