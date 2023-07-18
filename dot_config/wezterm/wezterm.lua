local wezterm = require("wezterm")
local mux = wezterm.mux

wezterm.on("gui-startup", function()
	local tab, pane, window = mux.spawn_window({})
	-- window:gui_window():maximize()
	window:gui_window():toggle_fullscreen()
end)

return {
	-- ui
	color_scheme = "nordfox",
	font = wezterm.font("OperatorMonoSSmLig Nerd Font Mono"),
	font_size = 20,

  window_background_image = "/Users/ruizhang/FUCK/nordfox.jpeg",
  window_background_image_hsb = {
    -- Darken the background image by reducing it to 1/3rd
    brightness = 0.3,

    -- You can adjust the hue by scaling its value.
    -- a multiplier of 1.0 leaves the value unchanged.
    hue = 1.0,

    -- You can adjust the saturation also.
    saturation = 1.0,
  },

	-- window
	window_close_confirmation = "NeverPrompt",
	window_decorations = "RESIZE",
	enable_tab_bar = false,
	window_padding = {
		left = 0,
		bottom = 0,
	},
}
