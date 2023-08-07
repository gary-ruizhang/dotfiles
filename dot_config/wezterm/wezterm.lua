local wezterm = require("wezterm")
local mux = wezterm.mux

wezterm.on("gui-startup", function()
  -- TODO: find better way to create workspace
	local first_tab, pane, window = mux.spawn_window({
    workspace = 'work',
    cwd = "/Users/ruizhang/Work/workspace/ivoss_web",
  })
  first_tab:set_title "npm"
  local tab = window:spawn_tab {
    cwd = "/Users/ruizhang/Work/workspace/ivoss_web"
  }
  tab:set_title "front"
  local tab = window:spawn_tab {
    cwd = "/Users/ruizhang/Work/workspace/ivoss_web_service"
  }
  tab:set_title "back"
  local tab = window:spawn_tab {
    cwd = "/Users/ruizhang/Work/ivoss_bigdata"
  }
  tab:set_title "bss/bigdata"
  local tab = window:spawn_tab {
    cwd = "/Users/ruizhang"
  }
  tab:set_title "other"
  local tab = window:spawn_tab {
    cwd = "/Users/ruizhang"
  }
  tab:set_title "ssh"
  first_tab:activate()
	-- window:gui_window():maximize()
	window:gui_window():toggle_fullscreen()

	window:gui_window():set_left_status(
		wezterm.format({
			{Foreground={Color="#F8F8F2"}},
			{Background={Color="#44475A"}},
			{Text= " " .. window:get_workspace() .. " "},
		})
	);
end)

wezterm.on("update-right-status", function(window, pane)
	local cwd = " "..pane:get_current_working_dir():sub(8).." "; -- remove file:// uri prefix
	local date = wezterm.strftime(" %R %a %m-%d");
	local hostname = " "..wezterm.hostname().." ";

	window:set_right_status(
		wezterm.format({
			{Foreground={Color="#8BE9FD"}},
			{Text=""},
		})..
		wezterm.format({
			{Foreground={Color="#282A36"}},
			{Background={Color="#8BE9FD"}},
			{Text=cwd},
		})..
		wezterm.format({
			{Foreground={Color="#6272A4"}},
			{Background={Color="#8BE9FD"}},
			-- {Background={Color="#F8F8F2"}},
			{Text=""},
		})..
		wezterm.format({
			{Foreground={Color="#F8F8F2"}},
			{Background={Color="#6272A4"}},
			{Text=date},
		})..
		wezterm.format({
			{Foreground={Color="#00AF87"}},
			{Background={Color="#00875F"}},
		})
	);
end);

local copy_mode = nil
local search_mode = nil
if wezterm.gui then
  copy_mode = wezterm.gui.default_key_tables().copy_mode
  search_mode = wezterm.gui.default_key_tables().search_mode

  -- Enter search mode to edit the pattern.
  -- When the search pattern is an empty string the existing pattern is preserved
  table.insert(
    copy_mode,
    {key="/", mods="NONE", action=wezterm.action{Search={CaseInSensitiveString=""}}}
  )
  table.insert(
    copy_mode,
    -- navigate any search mode results
    {key="n", mods="NONE", action=wezterm.action{CopyMode="NextMatch"}}
  )
  -- NOTE: work for mouse cursor not the terminal cursor
  table.insert(
    copy_mode,
    {key="*", mods="NONE", action=wezterm.action{SelectTextAtMouseCursor='Word'}}
  )
  table.insert(
    copy_mode,
    -- navigate any search mode results
    {key="N", mods="SHIFT", action=wezterm.action{CopyMode="PriorMatch"}}
  )

  table.insert(
    search_mode,
    {key="Escape", mods="NONE", action=wezterm.action{CopyMode="Close"}}
  )
  table.insert(
    search_mode,
    -- Go back to copy mode when pressing enter, so that we can use unmodified keys like "n"
    -- to navigate search results without conflicting with typing into the search area.
    {key="Enter", mods="NONE", action="ActivateCopyMode"}
  )
end

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
    { key = "0", mods = "LEADER",       action=wezterm.action.ActivateLastTab },

    { key = "n", mods = "LEADER",       action=wezterm.action{ActivateTabRelative=1} },
    { key = "p", mods = "LEADER",       action=wezterm.action{ActivateTabRelative=-1} },
    { key = "[", mods = "LEADER",       action=wezterm.action.ActivateCopyMode },
  },

  key_tables = {
    copy_mode = copy_mode,
    search_mode = search_mode,
  },

  -- utilities
  --
  audible_bell = "Disabled",
}
