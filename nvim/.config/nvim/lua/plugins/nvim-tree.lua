return {
	'nvim-tree/nvim-tree.lua',
	dependencies = {
		'nvim-tree/nvim-web-devicons',
		'ellisonleao/gruvbox.nvim', -- OG nvim gruvbox
	},
	cmd = {
		'NvimTreeClipboard',
		'NvimTreeClose',
		'NvimTreeCollapse',
		'NvimTreeCollapseKeepBuffers',
		'NvimTreeFindFile',
		'NvimTreeFindFileToggle',
		'NvimTreeFocus',
		'NvimTreeGenerateOnAttach',
		'NvimTreeOpen',
		'NvimTreeRefresh',
		'NvimTreeResize',
		'NvimTreeToggle',
	},
	keys = {
		{ '<leader>t', function () require('nvim-tree.api').tree.toggle() end},
	},
	config = function()
		require('nvim-tree').setup({
			sort_by = "case_sensitive",
			sync_root_with_cwd = true,
			disable_netrw = true,
			update_focused_file = {
				enable = true,
			},
			view = {
				adaptive_size = true,
				side = "right", -- this doesn't look good with barbar
			},
			renderer = {
				add_trailing = true,
				highlight_git = true,
				icons = {
					git_placement = 'signcolumn',
				},
			},
			diagnostics = {
				enable = true,
				show_on_dirs = true,
			},
			git = {
				ignore = false,
			},
			actions = {
				change_dir = {
					enable = false,
				},
			},
		})

		local palette = require('gruvbox.palette')
		vim.cmd("highlight NvimTreeNormal guibg=" .. palette.colors.dark0_hard)
		vim.cmd("highlight NvimTreeWinSeparator guibg=" .. palette.colors.dark0_hard .. " guifg=" .. palette.colors.dark0_hard)
	end
}
