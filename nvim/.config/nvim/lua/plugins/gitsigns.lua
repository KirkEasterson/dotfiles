return {
	"lewis6991/gitsigns.nvim",
	cond = not vim.g.started_by_firenvim,
	version = "v0.*",
	event = 'VimEnter',
	cmd = {
		"Gitsigns",
	},
	keys = {
		-- {
		-- 	"<leader>bt",
		-- 	function ()
		-- 		require("gitsigns").toggle_current_line_blame()
		-- 	end,
		-- 	desc = "Toggle git line blame",
		-- },
	},
	opts = {
		current_line_blame_formatter = ' 󰊢 <author>  <author_time:%d %b %Y>  <summary>',
		signs = {
			add = { text = "│" },
			change = { text = "│" },
			topdelete = { text = "▔" },
			delete = { text = "▁" },
			changedelete = { text = "│" },
			untracked = { text = "" },
		},
		current_line_blame_opts = {
			delay = 10,
		},
	},
}



		-- message_template = " 󰊢 <author>  <date>  <summary>",
		-- date_format = "%d %b %Y",
		-- message_when_not_committed = " 󰊢 Not Committed Yet",
