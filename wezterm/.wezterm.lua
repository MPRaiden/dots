local wezterm = require("wezterm")
local act = wezterm.action

local leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }

local config = {
	leader = leader,
	keys = {
		{ key = "t", mods = "CTRL", action = act.SpawnTab("CurrentPaneDomain") },
		{ key = "]", mods = "CTRL", action = act.ActivateTabRelative(1) },
		{ key = "[", mods = "CTRL", action = act.ActivateTabRelative(-1) },
		{ key = "q", mods = "CTRL", action = act.CloseCurrentTab({ confirm = false }) },
		{ key = "x", mods = "LEADER", action = act.ActivateCopyMode },
	},
	enable_wayland = false,
	color_scheme = "Tokyo Night",
	automatically_reload_config = true,
	window_close_confirmation = "NeverPrompt",
	clean_exit_codes = { 0, 1, 130 },
	default_cursor_style = "BlinkingBlock",
	window_decorations = "RESIZE|INTEGRATED_BUTTONS",
	adjust_window_size_when_changing_font_size = false,
	check_for_updates = false,
	font = wezterm.font("Terminus"),
	font_size = 12,
	enable_tab_bar = true,
	tab_max_width = 50,
	use_fancy_tab_bar = false,
	scrollback_lines = 1000000,
	default_workspace = "main",
	harfbuzz_features = { "-calt", "-liga", "-dlig" },
	max_fps = 120,
	window_padding = {
		left = 10,
		right = 10,
		top = 10,
		bottom = 10,
	},
}

return config
