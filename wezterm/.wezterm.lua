local wezterm = require("wezterm")
local config = {}
local act = wezterm.action

-- Adjust Lua module path to include home directory for sessionizer.lua
package.path = package.path .. ";/home/mpr/?.lua"

-- Load the sessionizer module
local sessionizer = require("sessionizer")

-- Configure the sessionizer
sessionizer.setup({
	paths = {
		"/home/mpr/playground",
		"/home/mpr",
		"/home/mpr/dots",
		-- Add more paths as needed
	},
})

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
		{ key = "s", mods = "LEADER", action = act.ShowTabNavigator },
		{ key = "w", mods = "LEADER", action = act.SwitchToWorkspace },
		{
			key = "e",
			mods = "LEADER",
			action = act.PromptInputLine({
				description = wezterm.format({
					{ Attribute = { Intensity = "Bold" } },
					{ Foreground = { AnsiColor = "Fuchsia" } },
					{ Text = "Renaming Tab Title...:" },
				}),
				action = wezterm.action_callback(function(window, pane, line)
					if line then
						window:active_tab():set_title(line)
					end
				end),
			}),
		},
		{
			key = "f",
			mods = "LEADER",
			action = wezterm.action_callback(function(window, pane)
				sessionizer.toggle(window, pane)
			end),
		},
		{
			key = "F",
			mods = "LEADER|SHIFT",
			action = wezterm.action_callback(function(window, pane)
				sessionizer.reset_cache_and_toggle(window, pane)
			end),
		},
	},
}

return config
