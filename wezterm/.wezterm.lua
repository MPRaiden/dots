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
	font = wezterm.font("Agave Nerd Font", { weight = "Regular", italic = false }),
	enable_tab_bar = true,
	use_fancy_tab_bar = true,
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

	-- *** multiplexing / tmux-like features ***
	leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 },
	keys = {
		{
			key = "t",
			mods = "CTRL",
			action = act.SpawnTab("CurrentPaneDomain"),
		},
		-- Next tab: Ctrl + ]
		{
			key = "]",
			mods = "CTRL",
			action = act.ActivateTabRelative(1),
		},
		-- Previous tab: Ctrl + [
		{
			key = "[",
			mods = "CTRL",
			action = act.ActivateTabRelative(-1),
		},
		-- Splits
		{
			key = "-",
			mods = "CTRL",
			action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "=",
			mods = "CTRL",
			action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
		-- Pane navigation (vim style)
		{
			key = "h",
			mods = "CTRL",
			action = act.ActivatePaneDirection("Left"),
		},
		{
			key = "j",
			mods = "CTRL",
			action = act.ActivatePaneDirection("Down"),
		},
		{
			key = "k",
			mods = "CTRL",
			action = act.ActivatePaneDirection("Up"),
		},
		{
			key = "l",
			mods = "CTRL",
			action = act.ActivatePaneDirection("Right"),
		},
		-- Show workspace selector (works like switching sessions)
		{
			key = "s",
			mods = "LEADER",
			action = act.ShowLauncherArgs({ flags = "WORKSPACES" }),
		},
		-- Rename workspace (like naming a tmux session)
		{
			key = "$",
			mods = "LEADER|SHIFT",
			action = act.PromptInputLine({
				description = "Enter new name for workspace",
				action = wezterm.action_callback(function(window, pane, line)
					if line then
						mux.rename_workspace(window:mux_window():get_workspace(), line)
					end
				end),
			}),
		},
	},
}

return config
