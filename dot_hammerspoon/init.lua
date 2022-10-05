-- NOTE if below spoons exist in chezmoi then it's a customized version. otherwise preinstall needed.
hs.loadSpoon("Caffeine")
hs.loadSpoon("EmmyLua")
hs.loadSpoon("ReloadConfiguration")

spoon.Caffeine:start()
spoon.ReloadConfiguration:start()
-- trigger use keyboard maestro
spoon.ReloadConfiguration:bindHotkeys({"cmd", "alt", "ctrl"}, "r")

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "w", function ()
    hs.alert.show("fuck your mother")
end)
