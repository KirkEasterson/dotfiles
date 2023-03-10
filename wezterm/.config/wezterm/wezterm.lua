local wezterm = require('wezterm')
local config = {
	font = wezterm.font({
		family = 'ComicCodeLigatures Nerd Font',
		stretch = 'Normal',
	}),
	font_size = 14,
	line_height = 1.1,
	harfbuzz_features = {
		"calt=0",
		"clig=0",
		"liga=0",
	},
	color_scheme = "Gruvbox dark, medium (base16)",
	hide_tab_bar_if_only_one_tab = true,
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
	scrollback_lines = 100000,
	cursor_blink_rate = 0,
	hide_mouse_cursor_when_typing = true,
	pane_focus_follows_mouse = true,
	enable_wayland = false,
	max_fps = 120,
	window_close_confirmation = 'NeverPrompt',
	audible_bell = 'Disabled',
	animation_fps = 120,
}

return config
