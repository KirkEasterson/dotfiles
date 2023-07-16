return {
	"nvim-zh/colorful-winsep.nvim",
	event = "VeryLazy",
	dependencies = {
		'ellisonleao/gruvbox.nvim', -- OG nvim gruvbox
		'luisiacc/gruvbox-baby',
	},
	opts = {
		highlight = {
			bg = require('gruvbox.palette').colors.dark0,
			fg = require('gruvbox.palette').colors.neutral_orange,
		},
		interval = 30,
		no_exec_files = {
			"packer",
			"TelescopePrompt",
			"mason",
			"CompetiTest",
			"NvimTree",
		},
	},
	config = function(_, opts)
		require('colorful-winsep').setup(opts)
		vim.cmd("highlight WinSeparator guibg=None guifg=" .. require('gruvbox.palette').colors.gray)
	end

}
