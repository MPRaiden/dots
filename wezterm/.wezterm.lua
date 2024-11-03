local wezterm = require("wezterm")
local config = {}
local act = wezterm.action

config = {
	automatically_reload_config = true,
	window_close_confirmation = "AlwaysPrompt",
	default_cursor_style = "BlinkingBlock",
	color_scheme = "3024 (base16)", -- nice options: "3024 (base16)", "rose-pine", "tokyonight_night"
	adjust_window_size_when_changing_font_size = false,
	check_for_updates = false,
	font_size = 10,
	font = wezterm.font("JetBrains Mono Nerd Font", { weight = "DemiBold" }),
	enable_tab_bar = true,
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

	-- Dim inactive panes
	inactive_pane_hsb = {
		saturation = 0.24,
		brightness = 0.5,
	},

	-- Keys
	leader = { key = "a", mods = "CTRL", timeout_milliseconds = 2000 },
	keys = {
		-- Send C-a when pressing C-a twice
		{ key = "a", mods = "LEADER|CTRL", action = act.SendKey({ key = "a", mods = "CTRL" }) },
		{ key = "c", mods = "LEADER", action = act.ActivateCopyMode },
		{ key = "phys:Space", mods = "LEADER", action = act.ActivateCommandPalette },

		-- 	-- Pane keybindings
		{
			key = "v",
			mods = "LEADER",
			action = wezterm.action.SplitPane({
				direction = "Right",
				size = { Percent = 50 },
			}),
		},
		{
			key = "-",
			mods = "LEADER",
			action = wezterm.action.SplitPane({
				direction = "Down",
				size = { Percent = 50 },
			}),
		},
		{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
		{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
		{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
		{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
		{ key = "q", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },
		{ key = "o", mods = "LEADER", action = act.RotatePanes("Clockwise") },

		-- 	-- Tab keybindings (navigate tabs)
		{ key = "t", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
		{ key = "[", mods = "CTRL", action = act.ActivateTabRelative(-1) },
		{ key = "]", mods = "CTRL", action = act.ActivateTabRelative(1) },
		{ key = "s", mods = "LEADER", action = act.ShowTabNavigator },

		{ mods = "CTRL", key = "0", action = act.ResetFontSize },
		{ mods = "CTRL", key = "1", action = act.ActivateTab(0) },
		{ mods = "CTRL", key = "2", action = act.ActivateTab(1) },
		{ mods = "CTRL", key = "3", action = act.ActivateTab(2) },
		{ mods = "CTRL", key = "4", action = act.ActivateTab(3) },
		{ mods = "CTRL", key = "5", action = act.ActivateTab(4) },
		{
			-- rename tab
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

		-- Lastly, workspace
		{ key = "w", mods = "LEADER", action = act.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }) },
	},
}

return config
