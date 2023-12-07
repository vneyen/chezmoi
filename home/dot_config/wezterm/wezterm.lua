local wezterm = require 'wezterm'

local config = {}

-- Use config_builder if available
if wezterm.config_builder then config = wezterm.config_builder() end

-- Colors & Appearance
config.color_scheme = 'Tokyo Night'
config.window_background_opacity = 0.9

-- Tab bar
config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.inactive_pane_hsb = {
  saturation = 0.5,
  brightness = 0.3,
}

-- Key Bindings
config.disable_default_key_bindings = true
config.keys = {
  -- Command Palette and DebugOverlay
  { key = 'p', mods = "CTRL|SHIFT", action = wezterm.action.ActivateCommandPalette },
  { key = 'l', mods = "CTRL|SHIFT", action = wezterm.action.ShowDebugOverlay },
  -- Copy/Paste
  { key = 'c', mods = "CTRL|SHIFT", action = wezterm.action.CopyTo 'Clipboard' },
  { key = 'v', mods = "CTRL|SHIFT", action = wezterm.action.PasteFrom 'Clipboard' },
  -- Split  
  -- Tabs
  { key = 't', mods = "CTRL", action = wezterm.action({ SpawnTab = "CurrentPaneDomain"}) },
  { key = "Tab", mods = "CTRL", action = wezterm.action({ ActivateTabRelative = 1 }) },
  { key = "Tab", mods = "CTRL|SHIFT", action = wezterm.action({ ActivateTabRelative = -1 }) },
}

config.default_prog = {'pwsh.exe'}

return config
