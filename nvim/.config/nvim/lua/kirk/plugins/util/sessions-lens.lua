return {
	"rmagatti/session-lens",
	version = "*",
	cond = not vim.g.started_by_firenvim,
	dependencies = {
		"rmagatti/auto-session",
		"nvim-telescope/telescope.nvim",
	},
	cmd = {
		"SearchSession",
	},
	keys = {
		{
			"<leader>sl",
			function()
				require("auto-session.session-lens").search_session()
			end,
			desc = "Session lens",
		},
	},
	opts = {},
	config = function(_, opts)
		require("session-lens").setup(opts)

		require("telescope").load_extension("session-lens")
	end,
}
