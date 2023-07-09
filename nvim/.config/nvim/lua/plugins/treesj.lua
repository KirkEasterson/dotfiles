return {
	'Wansmer/treesj',
	dependencies = {
		'nvim-treesitter/nvim-treesitter'
	},
	cmd = {
		"TSJToggle",
		"TSJSplit",
		"TSJJoin",
	},
	keys = {
		{ '<leader>J', function() require('treesj').toggle() end },
	},
	opts = {
		use_default_keymaps = false,
	},
}
