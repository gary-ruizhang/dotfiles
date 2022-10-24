local wezterm = require 'wezterm'
local mux = wezterm.mux

wezterm.on("gui-startup", function()
  local tab, pane, window = mux.spawn_window{}
  -- window:gui_window():maximize()
  window:gui_window():toggle_fullscreen()
end)

return {
  -- ui
  color_scheme = 'nordfox',
  font = wezterm.font 'OperatorMonoSSmLig Nerd Font',
  font_size = 14,

  -- window
  window_close_confirmation = "NeverPrompt",
  window_decorations = "RESIZE",
  enable_tab_bar = false,
  window_padding = {
    left = 0,
    bottom = 0,
  },
}
