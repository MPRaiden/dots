local wezterm = require("wezterm")
local config = {}
local act = wezterm.action

-- Adjust Lua module path (if still needed for symlinks)
package.path = package.path .. ";" .. wezterm.config_dir .. "/?.lua"

-- Load the sessionizer module
local sessionizer = require("sessionizer")

-- Configure the sessionizer
sessionizer.setup({
	fd = "/usr/bin/fd", -- Use `/usr/bin/fdfind` if necessary
	paths = {
		"~/playground",
		"~/dots",
		-- Add valid paths containing directories
	},
})

-- Your existing config (unchanged)
config = {
	enable_wayland = false,
	color_scheme = "rose-pine",
	automatically_reload_config = true,
	window_close_confirmation = "AlwaysPrompt",
	default_cursor_style = "BlinkingBlock",
	adjust_window_size_when_changing_font_size = false,
	check_for_updates = false,
	font_size = 12,
	font = wezterm.font("JetBrains Mono Nerd Font", { weight = "DemiBold" }),
	enable_tab_bar = false,
	use_fancy_tab_bar = false,
	window_background_opacity = 0.9,
	scrollback_lines = 10000,
	default_workspace = "main",
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
	max_fps = 120,
	window_padding = {
		left = 15,
		right = 15,
		top = 15,
		bottom = 0,
	},
	font_rules = {
		{
			italic = true,
			font = wezterm.font("JetBrains Mono Nerd Font", { italic = false }),
		},
	},
	colors = {
		background = "black",
		cursor_bg = "#FFFFFF",
		cursor_fg = "#000000",
		cursor_border = "#FFFFFF",
	},
	leader = { key = "a", mods = "CTRL", timeout_milliseconds = 2000 },
	keys = {
		{ key = "a", mods = "LEADER|CTRL", action = act.SendKey({ key = "a", mods = "CTRL" }) },
		{ key = "c", mods = "LEADER", action = act.ActivateCopyMode },
		{ key = "phys:Space", mods = "LEADER", action = act.ActivateCommandPalette },
		{ key = "t", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
		{ key = "x", mods = "LEADER", action = act.CloseCurrentTab({ confirm = true }) },
		{ key = "[", mods = "CTRL", action = act.ActivateTabRelative(-1) },
		{ key = "]", mods = "CTRL", action = act.ActivateTabRelative(1) },
		{
			key = "s",
			mods = "LEADER",
			action = wezterm.action_callback(function(window, pane)
				sessionizer.toggle(window, pane)
			end),
		},
		{
			key = "S",
			mods = "LEADER|SHIFT",
			action = wezterm.action_callback(function(window, pane)
				sessionizer.resetCacheAndToggle(window, pane)
			end),
		},
	},
}

return config
