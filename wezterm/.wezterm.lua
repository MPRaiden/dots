local wezterm = require("wezterm")
local act = wezterm.action
local config = {}

config = {
	enable_wayland = false, -- wezterm doesnt start without this line, see more at https://github.com/wez/wezterm/issues/3121
	automatically_reload_config = true,
	window_close_confirmation = "AlwaysPrompt",
	default_cursor_style = "BlinkingBlock", -- doesn't work in nvim sessions :/
	color_scheme = "Tokyo Night",
	adjust_window_size_when_changing_font_size = false,
	window_decorations = "RESIZE",
	check_for_updates = false,
	font_size = 10,
	font = wezterm.font("JetBrains Mono Nerd Font", { weight = "DemiBold" }),
	enable_tab_bar = true,
	use_fancy_tab_bar = false, -- no effect if enable_tab_bar is set to false
	-- macos_window_background_blur = 20 -- for mac
	-- window_background_opacity = 0.9, -- transparency
	scrollback_lines = 3000,
	default_workspace = "main",
	window_padding = {
		left = 10,
		right = 10,
		top = 10,
		bottom = 0,
	},

	-- NOTE: testing phase, very cool setup which replaces most of tmux but no option for preview between tabs and no option for saving sessions (there are some plugins but I can just use tmux if I want to go in that direction)

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
		{ key = "v", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
		{ key = "h", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = "h", mods = "CTRL", action = act.ActivatePaneDirection("Left") },
		{ key = "j", mods = "CTRL", action = act.ActivatePaneDirection("Down") },
		{ key = "k", mods = "CTRL", action = act.ActivatePaneDirection("Up") },
		{ key = "l", mods = "CTRL", action = act.ActivatePaneDirection("Right") },
		{ key = "q", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },
		{ key = "o", mods = "LEADER", action = act.RotatePanes("Clockwise") },

		-- 	-- Tab keybindings (navigate tabs)
		{ key = "t", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
		{ key = "[", mods = "CTRL", action = act.ActivateTabRelative(-1) },
		{ key = "]", mods = "CTRL", action = act.ActivateTabRelative(1) },
		{ key = "n", mods = "LEADER", action = act.ShowTabNavigator },
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
