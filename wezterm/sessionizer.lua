local wezterm = require("wezterm")
local act = wezterm.action

local M = {}

local fd = ""
local rootPaths = {}

local cached = {}

M.resetCacheAndToggle = function(window, pane)
	wezterm.log_info("toggle sessionizer cache clear")
	cached = {}
	M.toggle(window, pane)
end

M.toggle = function(window, pane)
	wezterm.log_info("toggle sessionizer")
	if next(cached) == nil then
		table.insert(cached, { label = "~", id = "default" })
		for _, path in pairs(rootPaths) do
			wezterm.log_info("Searching path: " .. path)
			-- Search for all directories
			local success, stdout, stderr = wezterm.run_child_process({
				fd,
				"-H", -- Include hidden files
				"-t",
				"d", -- Search for directories only
				"--max-depth",
				"2", -- Limit depth to avoid deep recursion
				path,
			})

			if not success then
				wezterm.log_error("Failed to run fd: " .. stderr)
				return
			end

			wezterm.log_info("fd stdout: " .. stdout)
			wezterm.log_info("fd stderr: " .. stderr)

			for line in stdout:gmatch("([^\n]*)\n?") do
				if line == "" then
					goto continue
				end
				local label = line
				local id = line:gsub(".*/", "") -- Extract directory name as ID
				wezterm.log_info("Adding entry: label=" .. label .. ", id=" .. id)
				table.insert(cached, { label = tostring(label), id = tostring(id) })
				::continue::
			end
		end
		-- Debug: Log the cached entries
		wezterm.log_info("Cached entries: " .. wezterm.json_encode(cached))
	end
	window:perform_action(
		act.InputSelector({
			action = wezterm.action_callback(function(win, _, id, label)
				if not id and not label then
					wezterm.log_info("Cancelled")
				else
					wezterm.log_info("Selected " .. label)
					win:perform_action(act.SwitchToWorkspace({ name = id, spawn = { cwd = label } }), pane)
				end
			end),
			fuzzy = true,
			title = "Select project",
			choices = cached,
		}),
		pane
	)
end

---@param sessionizer SessionizerConfig
M.setup = function(sessionizer)
	fd = sessionizer.fd
	rootPaths = sessionizer.paths
	wezterm.log_info("Sessionizer setup: fd=" .. fd .. ", paths=" .. wezterm.json_encode(rootPaths))
end

return M
