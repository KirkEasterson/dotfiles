local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	-- lsp
	use {
		'neovim/nvim-lspconfig',
		config = function() require("kirk.lsp.lsp") end,
	}
	-- use 'nvim-lua/plenary.nvim'
	use 'nvim-lua/popup.nvim'
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			require('nvim-treesitter.install').update({ with_sync = true })
		end,
	}
	use 'nvim-treesitter/nvim-treesitter-context'
	use 'nvim-treesitter/nvim-treesitter-textobjects'
	use {
		'smjonas/inc-rename.nvim',
		config = function() require("kirk.lsp.inc_rename") end,
	}
	use {
		'theHamsta/nvim-semantic-tokens',
		config = function() require("kirk.lsp.semantic_tokens") end,
	}
	use {
		'kylechui/nvim-surround',
		tag = "*",
		config = function() require("kirk.surround") end,
	}
	use {
		'm-demare/hlargs.nvim',
		requires = { 'nvim-treesitter/nvim-treesitter' },
		config = function() require("kirk.lsp.hlargs") end,
	}

	-- completion
	use {
		'hrsh7th/nvim-cmp',
		requires = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"onsails/lspkind.nvim",
			"saadparwaiz1/cmp_luasnip",
		},
		config = function() require("kirk.lsp.completion") end,
	}

	-- snippets
	use {
		'L3MON4D3/LuaSnip',
		config = function() require("kirk.snippets.snippets") end,
	}

	-- telescope
	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope-fzy-native.nvim',
			'ThePrimeagen/git-worktree.nvim',
		},
		config = function() require("kirk.telescope") end,
	}

	-- git
	use {
		'TimUntersberger/neogit',
		requires = {
			'nvim-lua/plenary.nvim',
		},
		config = function() require("kirk.neogit") end,
	}
	use {
		'lewis6991/gitsigns.nvim',
		config = function() require("kirk.gitsigns") end,
	}
	use {
		'ThePrimeagen/git-worktree.nvim',
		config = function() require("kirk.git.git-worktree") end,
	}

	-- general utility
	use {
		'rmagatti/auto-session',
		config = function() require("kirk.auto_session") end,
	}
	use {
		'numToStr/Comment.nvim',
		config = function() require("kirk.comment") end,
	}
	use {
		'windwp/nvim-autopairs',
		config = function() require("kirk.autopairs") end,
	}
	-- use 'mbbill/undotree'
	use {
		'lukas-reineke/indent-blankline.nvim',
		config = function() require("kirk.indent") end,
	}
	use {
		'ellisonleao/glow.nvim',
		config = function() require("kirk.glow") end,
	}
	-- use 'kamykn/spelunker.vim'
	use 'kamykn/popup-menu.nvim'

	-- a e s t h e t i c
	use {
		'ellisonleao/gruvbox.nvim',
		config = function() require("kirk.gruvbox") end,
	}
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true },
		config = function() require("kirk.lualine") end,
	}
	use {
		'karb94/neoscroll.nvim',
		config = function() require("kirk.neoscroll") end,
	}
	use {
		'petertriho/nvim-scrollbar',
		config = function() require("kirk.scrollbar") end,
	}
	use 'kyazdani42/nvim-web-devicons' -- this shouldn't be necessary
	use {
		'romgrk/barbar.nvim',
		requires = {
			'kyazdani42/nvim-web-devicons'
		},
		config = function() require("kirk.barbar") end,
	}
	-- use 'goolord/alpha-nvim'

	-- language specific, because I'm lazy
	use {
		'simrat39/rust-tools.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
		},
		config = function() require("kirk.lsp.rust") end,
	}
	use {
		'jose-elias-alvarez/nvim-lsp-ts-utils',
		requires = {
			'jose-elias-alvarez/null-ls.nvim',
			'windwp/nvim-ts-autotag',
		},
		config = function() require("kirk.lsp.ts") end,
	}
	-- use 'tjdevries/nlua.nvim'
	use {
		'euclidianAce/BetterLua.vim',
		config = function() require("kirk.lsp.nlua") end,
	}
	-- use 'lervag/vimtex'

	-- misc
	use {
		'kyazdani42/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons',
		},
		config = function() require("kirk.tree") end,
	}
	use {
		'sindrets/winshift.nvim',
		config = function() require("kirk.winshift") end,
	}
	use {
		'monaqa/dial.nvim',
		config = function() require("kirk.dial") end,
	}

	if packer_bootstrap then
		require('packer').sync()
	end
end)
