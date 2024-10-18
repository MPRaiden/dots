local wezterm = require("wezterm")
local config = {}

config = {
	enable_wayland = false, -- wezterm doesnt start without this line, see more at https://github.com/wez/wezterm/issues/3121
	automatically_reload_config = true,
	window_close_confirmation = "AlwaysPrompt",
	default_cursor_style = "BlinkingBlock", -- doesn't work in nvim sessions :/
	color_scheme = "Rosé Pine (Gogh)", -- good options: "Rosé Pine (Gogh)", "Tokyo Night", "rose-pine-moon"
	adjust_window_size_when_changing_font_size = false,
	window_decorations = "RESIZE",
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
