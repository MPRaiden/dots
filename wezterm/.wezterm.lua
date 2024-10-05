local wezterm = require("wezterm")
local config = {}

config = {
	enable_wayland = false, -- wezterm doesnt start without this line, see more at https://github.com/wez/wezterm/issues/3121
	automatically_reload_config = true,
	window_close_confirmation = "AlwaysPrompt",
	default_cursor_style = "BlinkingBlock", -- doesn't work in tmux sessions
	color_scheme = "Rosé Pine (base16)",
	adjust_window_size_when_changing_font_size = false,
	window_decorations = "RESIZE",
	check_for_updates = false,
	font_size = 10,
	font = wezterm.font("JetBrains Mono Nerd Font", { weight = "DemiBold" }),
	-- window_background_opacity = 0.9, -- uncomment for transparency
	-- use_fancy_tab_bar = false,
	enable_tab_bar = false,
	window_padding = {
		left = 10,
		right = 10,
		top = 20,
		bottom = 0,
	},
}

-- The below is attemp of replacing tmux with wezterm but for not it's not in the stars, maybe one day
-- Set leader key
-- config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
--
-- config.keys = {
--
-- 	-- Pane splitting
-- 	{
-- 		key = "v",
-- 		mods = "LEADER",
-- 		action = wezterm.action.SplitPane({
-- 			direction = "Right",
-- 		}),
-- 	},
-- 	{
-- 		key = "h",
-- 		mods = "LEADER",
-- 		action = wezterm.action.SplitPane({
-- 			direction = "Down",
-- 		}),
-- 	},
--
-- 	-- Enter copy mode
-- 	{ key = "x", mods = "CTRL", action = wezterm.action.ActivateCopyMode },
--
-- 	-- Pane navigation
-- 	{ key = "h", mods = "CTRL", action = wezterm.action({ ActivatePaneDirection = "Left" }) },
-- 	{ key = "j", mods = "CTRL", action = wezterm.action({ ActivatePaneDirection = "Down" }) },
-- 	{ key = "k", mods = "CTRL", action = wezterm.action({ ActivatePaneDirection = "Up" }) },
-- 	{ key = "l", mods = "CTRL", action = wezterm.action({ ActivatePaneDirection = "Right" }) }, -- Tabs
-- 	{ key = "t", mods = "LEADER", action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }) },
-- 	{ key = "q", mods = "LEADER", action = wezterm.action({ CloseCurrentTab = { confirm = false } }) },
--
-- 	-- Leader key followed by "l" navigates to last open tab (if no tab nothing happens)
-- 	{
-- 		key = "l",
-- 		mods = "LEADER",
-- 		action = wezterm.action.ActivateLastTab,
-- 	},
--
-- 	-- Switch to specific tabs with Ctrl + Number (can also be done with CTRL + Tab)
-- 	{ key = "1", mods = "LEADER", action = wezterm.action({ ActivateTab = 0 }) },
-- 	{ key = "2", mods = "LEADER", action = wezterm.action({ ActivateTab = 1 }) },
-- 	{ key = "3", mods = "LEADER", action = wezterm.action({ ActivateTab = 2 }) },
-- 	{ key = "4", mods = "LEADER", action = wezterm.action({ ActivateTab = 3 }) },
-- 	{ key = "5", mods = "LEADER", action = wezterm.action({ ActivateTab = 4 }) },
-- 	{ key = "6", mods = "LEADER", action = wezterm.action({ ActivateTab = 5 }) },
-- 	{ key = "7", mods = "LEADER", action = wezterm.action({ ActivateTab = 6 }) },
-- 	{ key = "8", mods = "LEADER", action = wezterm.action({ ActivateTab = 7 }) },
-- 	{ key = "9", mods = "LEADER", action = wezterm.action({ ActivateTab = 8 }) },
-- }

return config
