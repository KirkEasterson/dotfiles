return {
	'goolord/alpha-nvim',
	dependencies = {
		'nvim-tree/nvim-web-devicons',
		'BlakeJC94/alpha-nvim-fortune',
	},
	lazy = false,
	config = function()

		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- Set header
		dashboard.section.header.val = {
			"                                                                       ",
			"           ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗          ",
			"           ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║          ",
			"           ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║          ",
			"           ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║          ",
			"           ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║          ",
			"           ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝          ",
			"                                                                       ",
			"                                    /\\                                ",
			"                               /\\  //\\\\                             ",
			"                        /\\    //\\\\///\\\\\\        /\\              ",
			"                       //\\\\  ///\\////\\\\\\\\  /\\  //\\\\          ",
			"          /\\          /  ^ \\/^ ^/^  ^  ^ \\/^ \\/  ^ \\              ",
			"         / ^\\    /\\  / ^   /  ^/ ^ ^ ^   ^\\ ^/  ^^  \\              ",
			"        /^   \\  / ^\\/ ^ ^   ^ / ^  ^    ^  \\/ ^   ^  \\       ^     ",
			"       /  ^ ^ \\/^  ^\\ ^ ^ ^   ^  ^   ^   ____  ^   ^  \\     /|\\    ",
			"      / ^ ^  ^ \\ ^  _\\___________________|  |_____^ ^  \\   /||o\\   ",
			"     / ^^  ^ ^ ^\\  /______________________________\\ ^ ^ \\ /|o|||\\  ",
			"    /  ^  ^^ ^ ^  /________________________________\\  ^  /|||||o|\\   ",
			"   /^ ^  ^ ^^  ^    ||___|___||||||||||||___|__|||      /||o||||||\\   ",
			"  / ^   ^   ^    ^  ||___|___||||||||||||___|__|||          | |        ",
			" / ^ ^ ^  ^  ^  ^   ||||||||||||||||||||||||||||||oooooooooo| |ooooooo ",
			" ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo ",
		}

		-- Set menu
		dashboard.section.buttons.val = {
			dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("f", "  > Find file", ":FzfLua files<CR>"),
			dashboard.button("o", "  > Recent", ":FzfLua oldfiles<CR>"),
			dashboard.button("r", "󰦛  > Restore session", ":RestoreSession<CR>"),
			dashboard.button("q", "  > Quit NVIM", ":qa<CR>"),
		}

		local fortune = require("alpha.fortune")
		dashboard.section.footer.val = fortune()

		-- Send config to alpha
		alpha.setup(dashboard.opts)

		-- Disable folding on alpha buffer
		vim.cmd([[ autocmd FileType alpha setlocal nofoldenable ]])
	end,
}
