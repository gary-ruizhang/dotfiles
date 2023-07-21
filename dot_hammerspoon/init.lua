-- NOTE if below spoons exist in chezmoi then it's a customized version. otherwise preinstall needed.
hs.loadSpoon("Caffeine")
hs.loadSpoon("EmmyLua")
hs.loadSpoon("LookupSelection")
hs.loadSpoon("MouseCircle")
hs.loadSpoon("MouseFollowsFocus")
hs.loadSpoon("ReloadConfiguration")

-- hyper mapped by karabiner
-- cmd+alt+ctrl+shift
-- NOTE hyper is not easy to press on HHKB
local hyper = {"⌘", "⌥", "⌃", "⇧",}

-- HACK use three key combined to interact with keyboard maestro
local cmd_alt_ctrl   = {"⌘", "⌥", "⌃",}
local cmd_alt_shift  = {"⌘", "⌥", "⇧",}
local cmd_ctrl_shift = {"⌘", "⌃", "⇧",}
local alt_ctrl_shift = {"⌥", "⌃", "⇧",}

spoon.Caffeine:start()
spoon.ReloadConfiguration:start()
spoon.LookupSelection:bindHotkeys({
    lexicon = {cmd_alt_ctrl, "d"},
})
spoon.MouseCircle:bindHotkeys({
    show = {cmd_alt_ctrl, "m"}
})

-- FIXME not work
spoon.MouseFollowsFocus:start()

hs.hotkey.bind(cmd_alt_ctrl, "w", function ()
    hs.alert.show("fuck your mother")
end)
