local wezterm = require("wezterm")

local function file_exists(path)
	local f = io.open(path, "r")
	if f ~= nil then
		io.close(f)
		return true
	else
		return false
	end
end

local config = {
	audible_bell = "Disabled",
	check_for_updates = false,
	color_scheme = "Builtin Solarized Dark",
	window_background_opacity = 0.9,
	inactive_pane_hsb = {
		hue = 1.0,
		saturation = 1.0,
		brightness = 1.0,
	},

	font = wezterm.font("JetBrains Mono", { weight = "Bold", italic = true }),
	font_size = 12.0,
	font_with_fallback = {
		wezterm.font("JetBrains Mono", { weight = "Bold", italic = true }),
		wezterm.font("FiraCode Nerd Font Mono", { weight = "Regular" }),
		wezterm.font("Noto Color Emoji", { scale = 0.8 }),
	},

	launch_menu = {},
	leader = { key = "a", mods = "CTRL" },
	disable_default_key_bindings = true,
	keys = {
		-- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
		{ key = "a", mods = "LEADER|CTRL", action = wezterm.action({ SendString = "\x01" }) },
		{ key = "-", mods = "LEADER", action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
		{
			key = "\\",
			mods = "LEADER",
			action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
		},
		{ key = "z", mods = "CTRL", action = "TogglePaneZoomState" },
		{ key = "c", mods = "CTRL", action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }) },
		{ key = "h", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Left" }) },
		{ key = "j", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Down" }) },
		{ key = "k", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Up" }) },
		{ key = "l", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Right" }) },
		{ key = "H", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Left", 5 } }) },
		{ key = "J", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Down", 5 } }) },
		{ key = "K", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Up", 5 } }) },
		{ key = "L", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Right", 5 } }) },
		{ key = "1", mods = "CTRL", action = wezterm.action({ ActivateTab = 0 }) },
		{ key = "2", mods = "CTRL", action = wezterm.action({ ActivateTab = 1 }) },
		{ key = "3", mods = "CTRL", action = wezterm.action({ ActivateTab = 2 }) },
		{ key = "4", mods = "CTRL", action = wezterm.action({ ActivateTab = 3 }) },
		{ key = "5", mods = "CTRL", action = wezterm.action({ ActivateTab = 4 }) },
		{ key = "6", mods = "CTRL", action = wezterm.action({ ActivateTab = 5 }) },
		{ key = "7", mods = "CTRL", action = wezterm.action({ ActivateTab = 6 }) },
		{ key = "8", mods = "CTRL", action = wezterm.action({ ActivateTab = 7 }) },
		{ key = "9", mods = "CTRL", action = wezterm.action({ ActivateTab = 8 }) },
		{ key = "Delete", mods = "CTRL", action = wezterm.action({ CloseCurrentTab = { confirm = true } }) },
		{ key = "x", mods = "CTRL", action = wezterm.action({ CloseCurrentPane = { confirm = true } }) },

		{ key = "n", mods = "SHIFT|CTRL", action = "ToggleFullScreen" },
		{ key = "v", mods = "CTRL", action = wezterm.action.PasteFrom("Clipboard") },
		{ key = "c", mods = "CTRL", action = wezterm.action.CopyTo("Clipboard") },
		{ key = "+", mods = "SHIFT|CTRL", action = "IncreaseFontSize" },
		{ key = "-", mods = "SHIFT|CTRL", action = "DecreaseFontSize" },
		{ key = "0", mods = "SHIFT|CTRL", action = "ResetFontSize" },
	},
	set_environment_variables = {},
}

return config
