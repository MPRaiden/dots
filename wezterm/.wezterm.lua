local wezterm = require("wezterm")
local config = {}

config = {
	automatically_reload_config = true,
	window_close_confirmation = "AlwaysPrompt",
	default_cursor_style = "BlinkingBlock", -- does not work in tmux sessions for some darned reason
	color_scheme = "rose-pine", -- Good options: 'rose-pine', 'tokyonight_night', 'GruvboxDarkHard', 'catppuccin-mocha'
	adjust_window_size_when_changing_font_size = false,
	check_for_updates = false,
	font_size = 10,
	font = wezterm.font("JetBrains Mono Nerd Font", { weight = "DemiBold" }),
	enable_tab_bar = false,
	use_fancy_tab_bar = false, -- no effect if enable_tab_bar is set to false
	window_background_opacity = 1, -- transparency (from 0 to 1)
	scrollback_lines = 3000,
	default_workspace = "main",
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" }, -- disables ligatures
	window_padding = {
		left = 10,
		right = 10,
		top = 10,
		bottom = 0,
	},
}

return config
