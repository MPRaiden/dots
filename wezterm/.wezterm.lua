local wezterm = require("wezterm")
local config = {}

config = {
	enable_wayland = false, -- wezterm doesnt start without this line, see more at https://github.com/wez/wezterm/issues/3121
	automatically_reload_config = true,
	window_close_confirmation = "NeverPrompt",
	default_cursor_style = "BlinkingBlock",
	color_scheme = "rose-pine",
	adjust_window_size_when_changing_font_size = false,
	window_decorations = "RESIZE",
	check_for_updates = false,
	font_size = 10,
	font = wezterm.font("JetBrains Mono Nerd Font", { weight = "DemiBold" }),
	enable_tab_bar = false,
	-- window_background_opacity = 0.9, -- uncomment for transparency
	window_padding = {
		left = 10,
		right = 10,
		top = 20,
		bottom = 0,
	},
}

return config
