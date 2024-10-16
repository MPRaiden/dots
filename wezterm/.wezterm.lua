local wezterm = require("wezterm")
-- local act = wezterm.action
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

	-- NOTE: test if possible to replace tmux with wezterm
	-- no option for preview between tabs
	-- no option for saving sessions (there are some plugins but I can just use tmux if I want to go in that direction)
	-- navigating using hjkl does not work for "Undotree" and "Trouble" plugins (which is annoying because I like using those and I dont want to use the mouse)

	-- Dim inactive panes
	-- inactive_pane_hsb = {
	-- 	saturation = 0.24,
	-- 	brightness = 0.5,
	-- },

	-- Keys
	-- leader = { key = "a", mods = "CTRL", timeout_milliseconds = 2000 },
	-- keys = {
	-- 	-- Send C-a when pressing C-a twice
	-- 	{ key = "a", mods = "LEADER|CTRL", action = act.SendKey({ key = "a", mods = "CTRL" }) },
	-- 	{ key = "c", mods = "LEADER", action = act.ActivateCopyMode },
	-- 	{ key = "phys:Space", mods = "LEADER", action = act.ActivateCommandPalette },
	--
	-- 	-- 	-- Pane keybindings
	-- 	{
	-- 		key = "v",
	-- 		mods = "LEADER",
	-- 		action = wezterm.action.SplitPane({
	-- 			direction = "Right",
	-- 			size = { Percent = 50 },
	-- 		}),
	-- 	},
	-- 	{
	-- 		key = "h",
	-- 		mods = "LEADER",
	-- 		action = wezterm.action.SplitPane({
	-- 			direction = "Down",
	-- 			size = { Percent = 50 },
	-- 		}),
	-- 	},
	-- 	{ key = "h", mods = "CTRL", action = act.ActivatePaneDirection("Left") },
	-- 	{ key = "j", mods = "CTRL", action = act.ActivatePaneDirection("Down") },
	-- 	{ key = "k", mods = "CTRL", action = act.ActivatePaneDirection("Up") },
	-- 	{ key = "l", mods = "CTRL", action = act.ActivatePaneDirection("Right") },
	-- 	{ key = "q", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },
	-- 	{ key = "o", mods = "LEADER", action = act.RotatePanes("Clockwise") },
	--
	-- 	-- 	-- Tab keybindings (navigate tabs)
	-- 	{ key = "t", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
	-- 	{ key = "[", mods = "CTRL", action = act.ActivateTabRelative(-1) },
	-- 	{ key = "]", mods = "CTRL", action = act.ActivateTabRelative(1) },
	-- 	{ key = "s", mods = "LEADER", action = act.ShowTabNavigator },
	-- 	{
	-- 		-- rename tab
	-- 		key = "e",
	-- 		mods = "LEADER",
	-- 		action = act.PromptInputLine({
	-- 			description = wezterm.format({
	-- 				{ Attribute = { Intensity = "Bold" } },
	-- 				{ Foreground = { AnsiColor = "Fuchsia" } },
	-- 				{ Text = "Renaming Tab Title...:" },
	-- 			}),
	-- 			action = wezterm.action_callback(
	-- 				-- NOTE: unsure why but removing this 'unsured' pane argument leads to breaking the renaming functionality (no error but the tabs do don get renamed) so leave it
	-- 				function(window, pane, line)
	-- 					if line then
	-- 						window:active_tab():set_title(line)
	-- 					end
	-- 				end
	-- 			),
	-- 		}),
	-- 	},
	--
	-- 	-- Lastly, workspace
	-- 	{ key = "w", mods = "LEADER", action = act.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }) },
	-- },
}

return config
