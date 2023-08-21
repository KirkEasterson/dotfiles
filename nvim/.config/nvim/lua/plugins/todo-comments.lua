return {
	"folke/todo-comments.nvim",
	version = "v1.1.*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- "folke/trouble.nvim",
		"nvim-telescope/telescope.nvim",
	},
	event = "VeryLazy",
	cmd = {
		"TodoLocList",
		"TodoQuickFix",
		"TodoTelescope",
		"TodoTrouble",
	},
	keys = {
		{
			'<leader>DT',
			'<Cmd>TodoTelescope<CR>',
			desc = "View TODOs",
		},
	},
	opts = {},
}
