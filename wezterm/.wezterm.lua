local wezterm = require("wezterm")
local config = {}

config = {
	color_scheme = "Apathy (base16)",
	automatically_reload_config = true,
	window_close_confirmation = "AlwaysPrompt",
	default_cursor_style = "BlinkingBlock",
	adjust_window_size_when_changing_font_size = false,
	check_for_updates = false,
	font_size = 11,
	font = wezterm.font("JetBrains Mono Nerd Font", { weight = "DemiBold" }),
	enable_tab_bar = false,
	window_background_opacity = 1,
	scrollback_lines = 10000,
	default_workspace = "main",
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" }, -- disables ligatures
	max_fps = 120,
	window_padding = {
		left = 15,
		right = 15,
		top = 15,
		bottom = 0,
	},

	-- Define font rules here (but mainly disable italics as they annoy me)
	font_rules = {
		{
			italic = true,
			font = wezterm.font("JetBrains Mono Nerd Font", { italic = false }),
		},
	},
	colors = {
		background = "black",
		cursor_bg = "#FFFFFF", -- White cursor background
		cursor_fg = "#000000", -- Black cursor foreground (inverse)
		cursor_border = "#FFFFFF", -- White cursor border
	},
}

return config
