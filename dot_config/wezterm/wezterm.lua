local wezterm = require("wezterm")
local mux = wezterm.mux

wezterm.on("gui-startup", function()
	local tab, pane, window = mux.spawn_window({})
	-- window:gui_window():maximize()
	window:gui_window():toggle_fullscreen()
end)

-- The filled in variant of the < symbol
local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider

-- The filled in variant of the > symbol
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider

-- This function returns the suggested title for a tab.
-- It prefers the title that was set via `tab:set_title()`
-- or `wezterm cli set-tab-title`, but falls back to the
-- title of the active pane in that tab.
function tab_title(tab_info)
  local title = tab_info.tab_title
  -- if the tab title is explicitly set, take that
  if title and #title > 0 then
    return title
  end
  -- Otherwise, use the title from the active pane
  -- in that tab
  return tab_info.active_pane.title
end

wezterm.on("update-right-status", function(window, pane)
	local cwd = " "..pane:get_current_working_dir():sub(8).." "; -- remove file:// uri prefix
	local date = wezterm.strftime(" %R  %a  %m-%d");
	local hostname = " "..wezterm.hostname().." ";

	window:set_right_status(
		wezterm.format({
			{Foreground={Color="#8be9fd"}},
			{Text=""},
		})..
		wezterm.format({
			{Foreground={Color="#282a36"}},
			{Background={Color="#8be9fd"}},
			{Text=cwd},
		})..
		wezterm.format({
			{Foreground={Color="#6272A4"}},
			{Background={Color="#8be9fd"}},
			-- {Background={Color="#F8F8F2"}},
			{Text=""},
		})..
		wezterm.format({
			{Foreground={Color="#F8F8F2"}},
			{Background={Color="#6272A4"}},
			{Text=date},
		})..
		wezterm.format({
			{Foreground={Color="#00af87"}},
			{Background={Color="#00875f"}},
		})
	);
end);

return {
	-- ui
  --
	color_scheme = "dracula-pro",
	font = wezterm.font("MonoLisa Static-Script"),
	font_size = 20,

  -- window
  --
  -- window_background_image = "/Users/ruizhang/FUCK/nordfox.jpeg",
  -- window_background_image_hsb = {
  --   -- Darken the background image by reducing it to 1/3rd
  --   brightness = 0.3,
  --
  --   -- You can adjust the hue by scaling its value.
  --   -- a multiplier of 1.0 leaves the value unchanged.
  --   hue = 1.0,
  --
  --   -- You can adjust the saturation also.
  --   saturation = 1.0,
  -- },

	window_close_confirmation = "NeverPrompt",
	window_decorations = "RESIZE",
	window_padding = {
	  top = 0,
		left = 0,
    right = 0,
		bottom = 0,
	},

  -- tab
  --
  tab_bar_at_bottom = true,
  use_fancy_tab_bar = false,

  -- keybindings
  --
  leader = { key="a", mods="CTRL" },

  keys = {
    -- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
    { key = "a", mods = "LEADER|CTRL",  action=wezterm.action{SendString="\x01"}},
    { key = "-", mods = "LEADER",       action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
    { key = "\\",mods = "LEADER",       action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
    { key = "z", mods = "LEADER",       action="TogglePaneZoomState" },
    { key = "c", mods = "LEADER",       action=wezterm.action{SpawnTab="CurrentPaneDomain"}},
    { key = "h", mods = "LEADER",       action=wezterm.action{ActivatePaneDirection="Left"}},
    { key = "j", mods = "LEADER",       action=wezterm.action{ActivatePaneDirection="Down"}},
    { key = "k", mods = "LEADER",       action=wezterm.action{ActivatePaneDirection="Up"}},
    { key = "l", mods = "LEADER",       action=wezterm.action{ActivatePaneDirection="Right"}},
    { key = "1", mods = "LEADER",       action=wezterm.action{ActivateTab=0}},
    { key = "2", mods = "LEADER",       action=wezterm.action{ActivateTab=1}},
    { key = "3", mods = "LEADER",       action=wezterm.action{ActivateTab=2}},
    { key = "4", mods = "LEADER",       action=wezterm.action{ActivateTab=3}},
    { key = "5", mods = "LEADER",       action=wezterm.action{ActivateTab=4}},
    { key = "6", mods = "LEADER",       action=wezterm.action{ActivateTab=5}},
    { key = "7", mods = "LEADER",       action=wezterm.action{ActivateTab=6}},
    { key = "8", mods = "LEADER",       action=wezterm.action{ActivateTab=7}},
    { key = "9", mods = "LEADER",       action=wezterm.action{ActivateTab=-1}},

    { key = "n", mods = "LEADER",       action=wezterm.action{ActivateTabRelative=1} },
    { key = "p", mods = "LEADER",       action=wezterm.action{ActivateTabRelative=-1} },
  },

  -- utilities
  --
  audible_bell = "Disabled",
}
