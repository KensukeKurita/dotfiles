-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.
config.automatically_reload_config = true
-- transparent of window
config.window_background_opacity = 0.90
-- remove title bar
config.window_decorations = "RESIZE"
-- transparent of tab bar
config.window_frame = {
  inactive_titlebar_bg = "none",
    active_titlebar_bg = "none",
}

config.audible_bell = 'Disabled'

-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28

-- the font config
config.font_size = 14
-- https://github.com/yuru7/moralerspace
config.font = wezterm.font 'Moralerspace Neon'

-- colorscheme
config.color_scheme = 'AdventureTime'

-- Finally, return the configuration to wezterm:
return config
