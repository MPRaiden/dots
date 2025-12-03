local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux

local config = {
	enable_wayland = false,
	color_scheme = "rose-pine",
	automatically_reload_config = true,
	window_close_confirmation = "NeverPrompt",
	clean_exit_codes = { 0, 1, 130 },
	default_cursor_style = "BlinkingBlock",
	adjust_window_size_when_changing_font_size = false,
	check_for_updates = false,
	font_size = 18,
	font = wezterm.font("CaskaydiaCove Nerd Font", { weight = "Regular", italic = false }),
	enable_tab_bar = false,
	use_fancy_tab_bar = false,
	scrollback_lines = 10000,
	default_workspace = "main",
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
	max_fps = 120,
	window_padding = {
		left = 15,
		right = 15,
		top = 15,
		bottom = 15,
	},
}

return config
