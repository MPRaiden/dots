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
	color_scheme = "rose-pine-moon",
	automatically_reload_config = true,
	window_close_confirmation = "NeverPrompt", -- No prompts for closing windows/tabs
	clean_exit_codes = { 0, 1, 130 }, -- Treat shell exits as closable
	default_cursor_style = "BlinkingBlock",
	adjust_window_size_when_changing_font_size = false,
	check_for_updates = false,
	font_size = 15,
	font = wezterm.font("Agave Nerd Font", { weight = "Regular", italic = false }),
	enable_tab_bar = false,
	use_fancy_tab_bar = false,
	--window_background_opacity = 0.8,
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
	colors = {
		background = "black",
	},
	leader = { key = "a", mods = "CTRL", timeout_milliseconds = 2000 },
	keys = {
		{ key = "a", mods = "LEADER|CTRL", action = act.SendKey({ key = "a", mods = "CTRL" }) },
		{ key = "c", mods = "LEADER", action = act.ActivateCopyMode },
		{ key = "phys:Space", mods = "LEADER", action = act.ActivateCommandPalette },
		{ key = "[", mods = "CTRL", action = act.SwitchWorkspaceRelative(-1) },
		{ key = "]", mods = "CTRL", action = act.SwitchWorkspaceRelative(1) },
		{ key = "s", mods = "LEADER", action = act.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }) }, -- Workspace switcher
		{ key = "q", mods = "LEADER", action = act.CloseCurrentPane({ confirm = false }) },
		{
			key = "f",
			mods = "LEADER",
			action = wezterm.action_callback(function(window, pane)
				sessionizer.toggle(window, pane)
			end),
		},
	},
}

return config
